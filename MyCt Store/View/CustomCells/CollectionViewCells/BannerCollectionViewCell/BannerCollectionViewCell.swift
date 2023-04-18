//
//  BannerCollectionViewCell.swift
//  MyCt Store
//
//  Created by Rahul on 05/04/23.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bannerImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        bannerImageView.setCorner(radius: 8)
    }
}
