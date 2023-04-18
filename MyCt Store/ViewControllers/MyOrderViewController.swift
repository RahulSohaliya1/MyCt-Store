//
//  MyOrderViewController.swift
//  MyCt Store
//
//  Created by Rahul on 10/04/23.
//

import UIKit

class MyOrderViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var OrderTableView: UITableView!
    
    var viewModel: OrderViewModel = OrderViewModel()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setup() {
        OrderTableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
        
        OrderTableView.separatorStyle = .none
        
        if #available(iOS 15.0, *) { OrderTableView.sectionHeaderTopPadding = 0.0 }
    }
    
    private func fetchDetails() {
        guard Config.isInternetAvailable() else {
            print("Display no internet availabel popup")
            return
        }
        
        viewModel.fetchDetails { result in
            switch result {
            case .success(let success):
                print("Reload tabelView")
                self.OrderTableView.reloadData()
            case .failure(let error):
                print("Show this \(error.localizedDescription) in alert View")
            }
        }
    }
}

extension MyOrderViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell: OrderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell") as! OrderTableViewCell
        cell.set(arrOrders: viewModel.arrStoreDetails)
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 5000
    }
}


