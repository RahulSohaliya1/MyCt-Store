//
//  OrderCollectionViewCell.swift
//  MyCt Store
//
//  Created by Rahul on 10/04/23.
//

import UIKit

class OrderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var OrderView: UIView!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var dateAndTimeLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var storeNameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var reOrderButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        statusLabel.setCorner(radius: 10)
        dateAndTimeLabel.textColor = .lightGray
        statusLabel.textColor = .white
    }
    
    func statusColor(view: UIView) {
        switch statusLabel.text {
        case "Confirmed":
            view.backgroundColor = .systemGreen
        case "Pending":
            view.backgroundColor = .systemOrange
        case "Cancelled":
            view.backgroundColor = .systemRed
        case "Dispatched":
            view.backgroundColor = .systemRed
        case "Delivered":
            view.backgroundColor = .systemCyan
        default:
            view.backgroundColor = .white
        }
    }
}
