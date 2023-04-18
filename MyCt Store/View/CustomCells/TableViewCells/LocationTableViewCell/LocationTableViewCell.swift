//
//  LocationTableViewCell.swift
//  MyCt Store
//
//  Created by Rahul on 29/03/23.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewCity: UIView!
    
    @IBOutlet weak var viewArea: UIView!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var arrowButton: UIImageView!
    
    @IBOutlet weak var cityButton: UIButton!
    
    @IBOutlet weak var areaButton: UIButton!
    
    @IBOutlet weak var areaLabel: UILabel!
    
    @IBOutlet weak var nextarrowButton: UIImageView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var searchButton: UIButton!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        viewCity.setCorner(radius: 5)
        viewArea.setCorner(radius: 5)
        
        viewCity.setBorder(width: 1, color: UIColor.white)
        viewArea.setBorder(width: 1, color: UIColor.white)
        
        backgroundColor = AppColors.primaryColor
        
        areaButton.setTitle("Adajan", for: .normal)
        cityButton.setTitle("Surat", for: .normal)
        
        searchBar.tintColor = AppColors.primaryColor
        searchBar.barTintColor = AppColors.primaryColor
        searchBar.backgroundColor = AppColors.primaryColor
        
        searchBar.isTranslucent = false
//        self.lblLocationName.font = AppFontMedium(size: 14)
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.font = UIFont.systemFont(ofSize: 14)
        textFieldInsideSearchBar?.backgroundColor = .white
        textFieldInsideSearchBar?.attributedPlaceholder = NSAttributedString(string: PlaceHolder.searchStore,attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        
        textFieldInsideSearchBar?.setCorner(radius: 8)
    }
}
