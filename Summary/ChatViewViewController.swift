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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomMessageCell", for: indexPath) as! CustomTableViewCell
        let messageArray = ["第一条信息","第二条信息","第三条信息"]
        cell.messageBody.text = messageArray[indexPath.row]
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //messageTableView.delegate = self as! UITableViewDelegate
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
