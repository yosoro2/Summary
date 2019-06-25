//
//  ShopWebViewController.swift
//  my collection
//
//  Created by yosoro on 2019/1/13.
//  Copyright © 2019 yosoro. All rights reserved.
//

import UIKit
import WebKit

class ShopWebViewController: UIViewController {
    
    @IBOutlet weak var web: WKWebView!
    var shopName = ""
    var shopUrl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = shopName
        navigationItem.largeTitleDisplayMode = .never
        let url = URL(string: shopUrl)
        let request = URLRequest(url: url!)
        web.load(request)
    }
    

   
}
