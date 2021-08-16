//
//  NewsFeedNewsOwner.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//

import UIKit



class NewsFeedNewsOwnerCell: UITableViewCell {
    
  
    @IBOutlet weak var ownerAvatar: UIImageView!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var dateTimeOfPublication: UILabel!
    
    
    
    func setUpCell() {
        ownerAvatar.layer.cornerRadius = 20.0
    }
    
    
    func clearCell() {
        ownerAvatar.image = nil
        ownerName.text = nil
        dateTimeOfPublication.text = nil
    }
    
    
    func configureCell(){
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
        setUpCell()
    }
}
