//
//  NewsFeedNewsCommentFromOwnerCell.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//

import UIKit

// MARK: The class is responsible for the information: comment of the news owner

class NewsFeedNewsCommentFromOwnerCell: UITableViewCell {

    @IBOutlet weak var ownerInitialComment: UILabel!
    
    
    func setUpCell() {
    }
    
    
    func clearCell() {
        ownerInitialComment.text = nil}
    
    
    func configureCell(){
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
        setUpCell()
    }


    
}
