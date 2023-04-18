//
//  HomeViewModel.swift
//  MyCt Store
//
//  Created by Rahul on 01/04/23.
//

import Foundation
import Alamofire

final class HomeViewModel {
    private(set) var section: [HomePageTableSection] = []
    private(set) var arrCatagories: [StoreTypeViewModel] = []
    private(set) var arrBanners: [BannerViewModel] = []
    private(set) var arrVendors: [VendorViewModel] = []
    private(set) var vendorCount: Int = 0
    private let apiManager: APIManager = APIManager()
    private(set) var selectedCatagoryIndex: Int = 0
    private(set) var selectedDeliveryIndex: Int = 0
    
    func fetchDetails(completion: @escaping(Result<(),Error>) -> Void) {
        let parameters: Parameters = ["area_id" : "4",
                                        "city_id" : "1",
                                        "custid" : "",
                                      "store_type" : selectedCatagoryIndex == 0 ? "" : arrCatagories[selectedCatagoryIndex].getId(),
                                      "type" : selectedDeliveryIndex == 0 ? "takeaway" : "delivery"]
        
        apiManager.request(with: APIEndPoints.homepage.url, methodType: .post, parameters: parameters) { response in
            switch response {
            case .success(let data):
                do {
                    let homePageAPIResponse = try JSONDecoder().decode(HomePageAPIResponse.self, from: data)
                    self.arrCatagories = homePageAPIResponse.arrOfStoreTypes.map { StoreTypeViewModel(storeType: $0)}
                    self.arrBanners = homePageAPIResponse.arrOfBanners.map { BannerViewModel(banner: $0)}
                    self.arrVendors = homePageAPIResponse.arrOfVendor.map { VendorViewModel(vendor: $0)}
                    self.vendorCount = homePageAPIResponse.numStores
                    self.loadSections()
                    print(self.arrCatagories)
                    completion(.success(()))
                } catch {
                    completion(.failure(APIError.invalidResponse))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func update(selectedCategoryIndex: Int) {
        self.selectedCatagoryIndex = selectedCategoryIndex
    }
    
    func update(selectedDeliveryIndex: Int) {
        self.selectedDeliveryIndex = selectedDeliveryIndex
    }
    
    private func loadSections() {
        section = []
        section.append(.address)
        section.append(.category(arrCatagories: self.arrCatagories))
        section.append(.banner(arrBanners: self.arrBanners))
        section.append(.deliveryOption(name: "takeaway"))
        section.append(.vendor(arrVendors: self.arrVendors))
    }
}

extension HomeViewModel {
    func numberOfSection() -> Int {
        if arrCatagories.count > 0, arrBanners.count > 0,  arrVendors.count > 0 {
            return 5
        }
        return 0
    }
    
    func numberOfRow() -> Int { return 1 }
}

enum HomePageTableSection {
    case address
    case category(arrCatagories: [StoreTypeViewModel])
    case banner(arrBanners: [BannerViewModel])
    case deliveryOption(name: String)
    case vendor(arrVendors: [VendorViewModel])
}
