//
//  OrderViewModel.swift
//  MyCt Store
//
//  Created by Rahul on 10/04/23.
//

import Foundation
import Alamofire

final class OrderViewModel {
    // MARK: - Variable
    private let apiManager: APIManager = APIManager()
    private(set) var arrStoreDetails: [StoreDataViewModel] = []
    
    // MARK: - getOrdersAPICall
    
    func fetchDetails(completion: @escaping(Result<(),Error>) -> Void) {
        apiManager.request(with: APIEndPoints.getOrder.url, methodType: .get) {
            response in
            switch response {
            case .success(let data):
                do {
                    let StoreOrder = try JSONDecoder().decode(OrderAPIResponse.self, from: data)
                    self.arrStoreDetails = StoreOrder.arrStoreData.map { StoreDataViewModel(storeData: $0)}
                    print(self.arrStoreDetails)
                    completion(.success(()))
                } catch {
                    completion(.failure(APIError.invalidResponse))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension OrderViewModel {
    
    func numberOfSection() -> Int {
        return 1
    }
        func numberOfRow() -> Int { return 1 }

}

enum OrderPageTableSection {
    case order(arrOrders: [StoreDataViewModel])
}
