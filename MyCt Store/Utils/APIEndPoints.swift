//
//  APIEndPoints.swift
//  MyCt Store
//
//  Created by Rahul on 31/03/23.
//

import Foundation

enum APIEndPoints {
    case getArea
    case getCity
    case homepage
    case getOrder
    
    var url: String {
        switch self {
            
//        case .getArea(let cityId):
//            return "\(Config.baseURL)/get_area/\(cityId)"
            
        case .getArea:
            return "\(Config.baseURL)/get_area"
            
        case .getCity:
            return "\(Config.baseURL)/get_city"
            
        case .homepage:
            return "\(Config.baseURL)/homepage"
            
        case .getOrder:
            return "\(Config.baseURL)/get_order/8"
        }
    }
}
