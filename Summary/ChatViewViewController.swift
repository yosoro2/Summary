//
//  ChatViewViewController.swift
//  Summary
//
//  Created by mac-44 on 2019/6/25.
//  Copyright © 2019 yosoro. All rights reserved.
//

import UIKit

class ChatViewViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendbutton: UIButton!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomTableViewCell
        let messageArray = ["第一条信息","第二条信息6465464612316513214613216546515486465132489465467864987616131321","第三条信息"]
        cell.messageBody.text  = messageArray[indexPath.row]
        return cell
        
    }
    

    @IBAction func textFieldDidBeginEditing(_ sender: UITextField) {
        UIView.animate(withDuration: 0.5){
            self.heightConstraint.constant = 348
            self.view.layoutIfNeeded()
        }
    }
    
    
    @IBAction func textFieldDidEndEditing(_ sender: Any) {
        UIView.animate(withDuration: 0.5){
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        messageTextField.endEditing(true)
        messageTextField.isEnabled = false
        sendbutton.isEnabled = false
        let user = BmobUser.current()
        
        let chatMessage = BmobObject(className: "Message")
        chatMessage?.setObject(user?.username, forKey: "Sender")
        chatMessage?.setObject(messageTextField.text, forKey: "MessageBody")
        chatMessage?.saveInBackground()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTextField.delegate = self
        configureTableView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
        
    }
    
    func configureTableView() {
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 120.0
    }

    @objc func tableViewTapped() {
        messageTextField.endEditing(true)
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
