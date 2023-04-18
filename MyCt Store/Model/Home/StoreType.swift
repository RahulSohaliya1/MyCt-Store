//
//  StoreType.swift
//  MyCt Store
//
//  Created by Rahul on 01/04/23.
//

import Foundation

struct StoreType: Decodable {
    var id: String
    var type: String
    var image: String
}

struct StoreTypeViewModel {
    private let storeType : StoreType
    
    init(storeType: StoreType) {
        self.storeType = storeType
    }
    
    func getId() -> String { storeType.id }
    func getType() -> String { storeType.type }
    func getImageName() -> String {
        return Config.baseURLForCatagories + (storeType.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
}
