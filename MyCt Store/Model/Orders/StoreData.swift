//
//  StoreData.swift
//  MyCt Store
//
//  Created by Rahul on 10/04/23.
//

import Foundation

struct StoreData: Decodable {
    let orderId: String
    let totalPrice: String
    let dateTime: String
    let vImage: String
    let orderStatus: String
    let vName : String
    
    private enum CodingKeys: String, CodingKey {
        case orderId = "order_id"
        case totalPrice = "total_price"
        case dateTime = "date_time"
        case vImage = "vimage"
        case orderStatus = "oreder_status"
        case vName = "vname"
    }
}


struct StoreDataViewModel {
    private let storeData: StoreData
    
    init(storeData: StoreData) {
        self.storeData = storeData
    }
    
    func getOrderId() -> String { storeData.orderId }
    
    func getTotalPrice() -> String {
        return "Payment Amount: ₹\(storeData.totalPrice)"
    }
        
    func getDateTime() -> String { storeData.dateTime }
        
    func getImage() -> String {
        return Config.baseURLForImage + (storeData.vImage.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
        
    func getStatus() -> String { storeData.orderStatus }
        
    func getVendorName() -> String { storeData.vName }
        
    
}
