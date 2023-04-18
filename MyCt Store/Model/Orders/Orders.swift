//
//  Orders.swift
//  MyCt Store
//
//  Created by Rahul on 10/04/23.
//

import Foundation

struct OrderAPIResponse: Decodable {
    let error: Bool
    let arrStoreData: [StoreData]
    
    enum CodingKeys: String,CodingKey {
        case error
        case arrStoreData = "data"
    }
}


