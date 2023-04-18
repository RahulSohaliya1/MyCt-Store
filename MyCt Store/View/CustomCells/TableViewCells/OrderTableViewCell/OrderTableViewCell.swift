//
//  OrderTableViewCell.swift
//  MyCt Store
//
//  Created by Rahul on 10/04/23.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var OrderStatusCollectionView: UICollectionView!
    
    var arrOrders: [StoreDataViewModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        OrderStatusCollectionView.register(UINib(nibName: "OrderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OrderCollectionViewCell")
    }
    

    
    func set(arrOrders: [StoreDataViewModel]) {
        self.arrOrders = arrOrders
        OrderStatusCollectionView.delegate = self
        OrderStatusCollectionView.dataSource = self
        OrderStatusCollectionView.reloadData()
    }
    
}

// MARK: - Collection FlowLayout Method

extension OrderTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 389, height: 171)
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

extension OrderTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrOrders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OrderCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrderCollectionViewCell", for: indexPath) as! OrderCollectionViewCell
        let order: StoreDataViewModel = arrOrders[indexPath.row]
        cell.idLabel.text = order.getOrderId()
        cell.priceLabel.text = order.getTotalPrice()
        cell.dateAndTimeLabel.text = order.getDateTime()
        cell.imageView.sd_setImage(with: URL(string: order.getImage()), placeholderImage: UIImage(systemName: "fireplace"))
        cell.statusLabel.text = order.getStatus()
        cell.storeNameLabel.text = order.getVendorName()
        cell.idLabel.textColor = .blue
        cell.priceLabel.textColor = .blue
        cell.statusColor(view: cell.statusLabel)
        return cell
    }
}


