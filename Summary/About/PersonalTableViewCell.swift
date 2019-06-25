//
//  PersonalTableViewCell.swift
//  BigHomeWork
//
//  Created by jieerma on 2019/1/15.
//  Copyright © 2019年 jieerma. All rights reserved.
//

import UIKit

class PersonalTableViewCell: UITableViewCell {
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Number: UILabel!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var Introduction: UILabel!
    @IBOutlet weak var PImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
