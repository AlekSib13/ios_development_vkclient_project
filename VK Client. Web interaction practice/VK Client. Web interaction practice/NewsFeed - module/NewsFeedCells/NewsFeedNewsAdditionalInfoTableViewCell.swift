//
//  NewsFeedNewsAdditionalInfoTableViewCell.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//

import UIKit

// MARK: The class is responsible for the information: number of news likes, number of news views

class NewsFeedNewsAdditionalInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var numberOfLikes: UILabel!
    
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var numberOfViews: UILabel!
    
    func setUpCell() {
    }
    
    
    func clearCell() {
        likesLabel.text = nil
        numberOfLikes.text = nil
        
        viewsLabel.text = nil
        numberOfViews.text = nil
    }
    
    
    func configureCell(){
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
