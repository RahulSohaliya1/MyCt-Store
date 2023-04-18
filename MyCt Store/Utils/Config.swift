//
//  Config.swift
//  MyCt Store
//
//  Created by Rahul on 28/03/23.
//

import Foundation
import UIKit

struct Config {
    static let appName = "MyCt Store"
    static let databaseName = "myctstore.db"
    static let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    static let androidLink: String = "https://play.google.com/store/apps/details?id=com.pragma.myctstore&pli=1"
    static let iOSLink: String = "itms-apps://itunes.apple.com/us/app/apple-store/id1552347410?mt=8"
    static let iOSSharingText: String = "Simple & easily order your food"
    static let appDateFormat = "dd MMM yyyy"
    static let appTimeFormat = "hh:mm a"
    static let serverDateFormat: String = "yyyy-MM-dd"
    static let amountSign: String = "₹"
    
    static func isInternetAvailable() -> Bool {
        let rechability = Reachability()!
        return rechability.isReachable ? (rechability.isReachableViaWiFi) || (rechability.isReachableViaWWAN) : false
    }
    
    static let baseURL: String = "https://myct.store/Mobile_Services/user/v2/index.php/"
    static let baseURLForCatagories = "https://myct.store/admin/uploads/food_type/"
    static let baseURLForImage = "https://myct.store/admin/uploads/"
}
