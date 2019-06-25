//
//  ZMovieTableViewCell.swift
//  BigHomeWork
//
//  Created by jieerma on 2019/1/12.
//  Copyright © 2019年 jieerma. All rights reserved.
//

import UIKit

class ZMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var MovieImage: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Url: UILabel!
    @IBOutlet weak var Breed: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
