//
//  ShopTableViewCell.swift
//  my collection
//
//  Created by yosoro on 2019/1/13.
//  Copyright © 2019 yosoro. All rights reserved.
//

import UIKit

class ShopTableViewCell: UITableViewCell {

    @IBOutlet weak var shopname: UILabel!
    @IBOutlet weak var shopprice: UILabel!
    @IBOutlet weak var shopaddress: UILabel!
    @IBOutlet weak var shopimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
