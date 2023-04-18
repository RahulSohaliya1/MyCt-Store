//
//  VendorTableViewCell.swift
//  MyCt Store
//
//  Created by Rahul on 29/03/23.
//

import UIKit


class VendorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var storeCountLabel: UILabel!
    @IBOutlet weak var viewMoreButton: UIButton!
    @IBOutlet weak var vendorsCollectionView: UICollectionView!

    var arrVendors: [VendorViewModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        vendorsCollectionView.register(UINib(nibName: "VendorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VendorCollectionViewCell")
    }
    
    func set(arrVendors: [VendorViewModel]) {
        self.arrVendors = arrVendors
        vendorsCollectionView.delegate = self
        vendorsCollectionView.dataSource = self
        vendorsCollectionView.reloadData()
    }
    
    @IBAction func viewMoreButtonTapped(_ sender: UIButton) {
        
        
    }
    
}

// MARK: - Collection FlowLayout Method

extension VendorTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 8.0, right: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension VendorTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrVendors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: VendorCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VendorCollectionViewCell", for: indexPath) as! VendorCollectionViewCell
        let vendor: VendorViewModel = arrVendors[indexPath.row]
        cell.vendorNameLabel.text = vendor.getName()
        cell.openLabel.text = String(vendor.isOpen())
        cell.priceLabel.text = "\(vendor.getMinimumOrder()) | \(vendor.getDeliveryCharges())"
        cell.vendorImageView.sd_setImage(with: URL(string: vendor.getImageName()), placeholderImage: UIImage(named: "fireplace"))
       // cell.cosmosView.text = String(vendor.getRating())
        return cell
    }
}

