//
//  CatagoriesTableViewCell.swift
//  MyCt Store
//
//  Created by Rahul on 29/03/23.
//
//
import UIKit

protocol CatagoriesTableViewCellDelegate: AnyObject {
    func didSelect(at index: Int)
}

class CatagoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var viewMoreButton: UIButton!
    @IBOutlet weak var catagoryCollectionView: UICollectionView!
    
    weak var delegate: CatagoriesTableViewCellDelegate?

    var arrCatagories: [StoreTypeViewModel] = []
    var selectedCatagoryIndex: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        catagoryCollectionView.register(UINib(nibName: "CatagoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CatagoryCollectionViewCell")
    }

    func set(arrCatagories: [StoreTypeViewModel], selectedCatagoryIndex: Int) {
        self.arrCatagories = arrCatagories
        self.selectedCatagoryIndex = selectedCatagoryIndex
        catagoryCollectionView.delegate = self
        catagoryCollectionView.dataSource = self
        catagoryCollectionView.reloadData()
    }

    @IBAction func viewMoreButtonTapped(_ sender: UIButton) {

    }
}

// MARK: - CollectionView FlowLayout Methods

extension CatagoriesTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 95, height: 40)
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

extension CatagoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCatagories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CatagoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatagoryCollectionViewCell", for: indexPath) as! CatagoryCollectionViewCell
        let catagory: StoreTypeViewModel = arrCatagories[indexPath.row]
        if selectedCatagoryIndex == indexPath.row {
            cell.backgroundColor = AppColors.primaryColor
            cell.nameLabel.textColor = .white
            cell.nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        } else {
            cell.backgroundColor = .white
            cell.nameLabel.textColor = AppColors.primaryColor
            cell.nameLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            
        }
        cell.nameLabel.text = catagory.getType()
//        cell.nameLabel.backgroundColor = .lightGray
//        let catagory: StoreTypeViewModel = arrCatagories[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(at: indexPath.row)
    }
}
