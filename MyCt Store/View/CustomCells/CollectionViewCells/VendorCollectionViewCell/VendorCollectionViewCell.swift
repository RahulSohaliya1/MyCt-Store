//
//  VendorCollectionViewCell.swift
//  MyCt Store
//
//  Created by Rahul on 29/03/23.
//

import UIKit
import Cosmos


class VendorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var vendorImageView: UIImageView!
    
    @IBOutlet weak var vendorNameLabel: UILabel!
    
    @IBOutlet weak var openLabel: UILabel!
    
    @IBOutlet weak var wishlistButton: UIButton!
        
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var cosmosView: CosmosView!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        vendorImageView.setCorner(radius: 8)
        //cosmosView.rating = 4
     
       
    }

    @IBAction func wishlistButtonTapped(_ sender: UIButton) {
        
    }
}
