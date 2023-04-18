//
//  Banner.swift
//  MyCt Store
//
//  Created by Rahul on 01/04/23.
//

import Foundation

struct Banner: Decodable {
    var id: Int
    var image: String
//    var srno: String
//    var name: String
//    var filename: String
//    var status: String
//    var businessName: String
//        var arrOfVendor: [Vendor]
    
    enum CodingKeys: String, CodingKey {
        case id = "v_id"
        case image = "filename"
//        case srno, name, filename, status
//        case businessName = "business_name"
//        case arrOfVendor = "vendor"
    }
}

struct BannerViewModel {
    
    private let banner: Banner
    
    init(banner: Banner) {
        self.banner = banner
    }
    
    func getId() -> Int { banner.id }
    func getImageName() -> String {
        return Config.baseURLForImage + (banner.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
}
