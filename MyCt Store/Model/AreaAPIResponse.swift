//
//  AreaAPIResponse.swift
//  MyCt Store
//
//  Created by Rahul on 31/03/23.
//

import Foundation

struct AreaAPIResponse: Decodable {
    var error: Bool
    var data: [Area]
}
