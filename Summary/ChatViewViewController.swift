//
//  ChatViewViewController.swift
//  Summary
//
//  Created by mac-44 on 2019/6/25.
//  Copyright © 2019 yosoro. All rights reserved.
//

import UIKit
import SwiftyJSON
import ChameleonFramework

class ChatViewViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,BmobEventDelegate {
    
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendbutton: UIButton!
    var messageArray:[Message] = [Message]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomTableViewCell
        cell.messageBody.text = messageArray[indexPath.row].messageBody
        cell.senderUsername.text = messageArray[indexPath.row].sender
        cell.avatarImageView.image = UIImage(named: "egg")
        
        if cell.senderUsername.text == BmobUser.current().username {
            cell.avatarImageView.backgroundColor = UIColor.flatMint()
            cell.messageBackground.backgroundColor = UIColor.flatSkyBlue()
        }else {
            cell.avatarImageView.backgroundColor = UIColor.flatWatermelon()
            cell.messageBackground.backgroundColor = UIColor.flatGray()
        }
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
    
    @IBAction func change(_ sender: UITextField) {
        empty()
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        messageTextField.endEditing(true)
        messageTextField.isEnabled = false
        sendbutton.isEnabled = false
        let user = BmobUser.current()
        let chatMessage = BmobObject(className: "Message")
        chatMessage?.setObject(user?.username, forKey: "Sender")
        chatMessage?.setObject(messageTextField.text, forKey: "MessageBody")
        chatMessage?.saveInBackground(){
            (isSuccessed,error) in
            if error != nil {
                print("error is \(error!.localizedDescription)")
            }else{
                print("聊天信息存储云端成功")
                self.messageTextField.isEnabled = true
                self.sendbutton.isEnabled = true
                self.messageTextField.text = ""
            }
        }
    }
    
    func listen() {
        let event = BmobEvent.default()
        if let event = event {
            event.delegate = self
            event.start()
        }
    }
    
    
    @IBAction func logo(_ sender: UIButton) {
        let alter = UIAlertController(title: "提示", message: "是否退出本界面并注销本账号", preferredStyle: .alert)
        let button = UIAlertAction(title: "否", style: .cancel, handler: nil)
        let button2 = UIAlertAction(title: "是", style: .destructive, handler: {action in
            BmobUser.logout()
            self.dismiss(animated: true, completion: nil)
        })
        alter.addAction(button)
        alter.addAction(button2)
        present(alter,animated: true,completion: nil)
    }
    func bmobEventDidConnect(_ event: BmobEvent!) {
        print(event.description)
    }
    
    func bmobEventCanStartListen(_ event: BmobEvent!) {
        event.listenTableChange(BmobActionTypeUpdateTable, tableName: "Message")
    }
    
    
    func bmobEvent(_ event: BmobEvent!, didReceiveMessage message: String!) {
        let messageJSON: JSON = JSON(parseJSON: message)
        print(messageJSON)
        
        let text = messageJSON["data"]["MessageBody"]
        let sender = messageJSON["data"]["Sender"]
        
        let message: Message = Message()
        message.messageBody = text.stringValue
        message.sender = sender.stringValue
        
        self.messageArray.append(message)
        self.configureTableView()
        self.messageTableView.reloadData()
    }
    
    func bmobEvent(_ event: BmobEvent!, error: Error!) {
        print(error.localizedDescription)
    }
    
    func bmobEventDidDisConnect(_ event: BmobEvent!, error: Error!) {
        
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
        listen()
        empty()
        // Do any additional setup after loading the view.
        
    }
    
    func configureTableView() {
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 120.0
    }
    
    func empty() {
        if messageTextField.text!.isEmpty {
            sendbutton.isEnabled = false
        }else{
            sendbutton.isEnabled = true
        }
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
