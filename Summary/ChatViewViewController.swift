//
//  ChatViewViewController.swift
//  Summary
//
//  Created by mac-44 on 2019/6/25.
//  Copyright © 2019 yosoro. All rights reserved.
//

import UIKit

class ChatViewViewController: UIViewController,UITabBarDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var messageTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        messageTableView.delegate = self as! UITableViewDelegate
        messageTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
