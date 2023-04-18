//
//  HomePageAPIResponse.swift
//  MyCt Store
//
//  Created by Rahul on 01/04/23.
//

import Foundation

struct HomePageAPIResponse: Decodable {
    var error: Bool
    var arrOfStoreTypes: [StoreType]
    var arrOfBanners: [Banner]
    var arrOfVendor: [Vendor]
    var numStores: Int
    
    
    
    
    enum CodingKeys: String, CodingKey {
        case error
        case arrOfStoreTypes = "store_type"
        case numStores = "num_stores"
        case arrOfVendor = "data"
        case arrOfBanners = "banner"
    }
}
