//
//  CatagoriessTableViewCell.swift
//  MyCt Store
//
//  Created by Rahul on 05/04/23.
//

import UIKit

class CatagoriessTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewMoreButton: UIButton!
    @IBOutlet weak var catagoryCollectionView: UICollectionView!
    
        var arrCatagories: [StoreTypeViewModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
                catagoryCollectionView.register(UINib(nibName: "CatagoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CatagoryCollectionViewCell")
    }
    
        func set(arrCatagories: [StoreTypeViewModel]) {
            self.arrCatagories = arrCatagories
            catagoryCollectionView.delegate = self
            catagoryCollectionView.dataSource = self
            catagoryCollectionView.reloadData()
        }
    
    @IBAction func viewMoreButtonTapped(_ sender: UIButton) {
        
    }
}

// MARK: - CollectionView FlowLayout Methods

extension CatagoriessTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 100)
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


// MARK: - CollectionView Delegate & Datasource Methods

extension CatagoriessTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCatagories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CatagoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatagoryCollectionViewCell", for: indexPath) as! CatagoryCollectionViewCell
        cell.nameLabel.backgroundColor = .lightGray
        let catagory: StoreTypeViewModel = arrCatagories[indexPath.row]
        cell.nameLabel.text = catagory.getType()
        return cell
    }
}


