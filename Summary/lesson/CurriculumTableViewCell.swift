//
//  CurriculumTableViewCell.swift
//  BigHomeWork
//
//  Created by jieerma on 2019/1/15.
//  Copyright © 2019年 jieerma. All rights reserved.
//

import UIKit

class CurriculumTableViewCell: UITableViewCell {
    
    @IBOutlet weak var curriculumName: UILabel!
    @IBOutlet weak var curriculumSource: UILabel!
    @IBOutlet weak var curriculumType: UILabel!
    @IBOutlet weak var curriculumImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
