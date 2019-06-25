//
//  PBooklTableViewCell.swift
//  BigHomeWork
//
//  Created by jieerma on 2019/1/13.
//  Copyright © 2019年 jieerma. All rights reserved.
//

import UIKit

class PBookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookType: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
