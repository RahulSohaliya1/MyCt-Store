//
//  HomeViewController.swift
//  MyCt Store
//
//  Created by Rahul on 31/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var HomeTableView: UITableView!
    
    
    // MARK: - Variables
    //    var arrAreas: [Area] = []
    var viewModel: HomeViewModel = HomeViewModel()
    var tableViewCells: [String] = ["LocationTableViewCell","CatagoriesTableViewCell","BannerTableViewCell","DeliveryOptionsTableViewCell","VendorTableViewCell"]
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//      fetchHomePageDetails()
//        fetchDetails()
        fetchAllDetails()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Initialization
    
    private func setup() {
        //        HomeTableView.register(UINib(nibName: "DeliveryOptionsTableViewCell", bundle: nil), forCellReuseIdentifier: "DeliveryOptionsTableViewCell")
        
        tableViewCells.forEach { cellName in
            HomeTableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        }
        
        HomeTableView.separatorStyle = .none
        
        if #available(iOS 15.0, *) { HomeTableView.sectionHeaderTopPadding = 0.0 }
    }
    
    // MARK: - Get Home Page Details
    
    //    private func fetchHomePageDetails() {
    //        guard Config.isInternetAvailable() else {
    //            print("Display no internet availabel popup")
    //            return
    //        }
    //
    //        let apiManager: APIManager = APIManager()
    //        apiManager.request(with: APIEndPoints.getArea.url) { response in
    //            switch response {
    //            case .success(let data): print("Data \(data)")
    //                do {
    //                    let areaAPIResponse = try JSONDecoder().decode(AreaAPIResponse.self, from: data)
    //                    self.arrAreas = areaAPIResponse.data
    //                    print(self.arrAreas)
    //                } catch {
    //                    print(error.localizedDescription)
    //                }
    //            case .failure(let error):
    //                print(error.localizedDescription)
    //            }
    //        }
    //    }
    //}
    
    private func fetchDetails() {
        guard Config.isInternetAvailable() else {
            print("Display no internet availabel popup")
            return
        }
        
//        viewModel.fetchDetails { result in
//            switch result {
//            case .success(let success):
//                print("Reload tabelView")
//                self.HomeTableView.reloadData()
//            case .failure(let error):
//                print("Show this \(error.localizedDescription) in alert View")
//            }
//        }
    }
    
    private func fetchAllDetails() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        
        viewModel.fetchDetails { result in
            switch result {
            case .success(let success):
                print("Reload tabelView")
//                self.HomeTableView.reloadData()
            case .failure(let error):
                print("Show this \(error.localizedDescription) in alert View")
            }
            dispatchGroup.leave()
        }
        
      
        
        dispatchGroup.notify(queue: .main) {
            print("banne api success thy gy")
            self.HomeTableView.reloadData()
        }
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: LocationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell") as! LocationTableViewCell
            return cell
        case 1:
            let cell: CatagoriesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CatagoriesTableViewCell") as! CatagoriesTableViewCell
            cell.delegate = self
            cell.set(arrCatagories: viewModel.arrCatagories, selectedCatagoryIndex: viewModel.selectedCatagoryIndex)
            return cell
        case 2:
            let cell: BannerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell") as! BannerTableViewCell
            cell.delegate = self
            cell.set(arrBanners: viewModel.arrBanners)
            return cell
        case 3:
            let cell: DeliveryOptionsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DeliveryOptionsTableViewCell") as! DeliveryOptionsTableViewCell
            cell.delegate = self
            cell.set(selectedIndex: viewModel.selectedDeliveryIndex)
            return cell
        case 4:
            let cell: VendorTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VendorTableViewCell") as! VendorTableViewCell
            cell.set(arrVendors: viewModel.arrVendors)
            return cell
        default: return UITableViewCell()
    }
}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 106
        case 1: return 56
        case 2: return 164
        case 3: return 67
        case 4: return 1000
        default: return 44
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0: return 0
        case 1: return 8
        case 2: return 0
        case 3: return 16
        case 4: return 8
        default: return 16
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 16))
        return headerView
    }
}

extension HomeViewController: CatagoriesTableViewCellDelegate {
    func didSelect(at index: Int) {
        viewModel.update(selectedCategoryIndex: index)
        HomeTableView.reloadData()
        fetchDetails()
    }
}

extension HomeViewController: DeliveryOptionsTableViewCellDelegate {
    func deliveryOptionSegmentTapped(selectedIndex: Int) {
        viewModel.update(selectedDeliveryIndex: selectedIndex)
        HomeTableView.reloadData()
        print(index)
    }
}

extension HomeViewController: BannerTableViewCellDelegate {
    func didselectBanner(at index: Int) {
        print(index)
    }
}
