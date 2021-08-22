//
//  NewsFeedNewsPhotoOrVideoCell.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//

import UIKit

// MARK: The class is responsible for the information: photos or video to news

class NewsFeedNewsPhotoCell: UITableViewCell {
    @IBOutlet weak var imageFromOwner: UIImageView!
    
    func setUpCell() {
    }
    
    
    func clearCell() {
        imageFromOwner.image = nil
    }
    
    
    func configureCell(){
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
        setUpCell()
    }
    
}
