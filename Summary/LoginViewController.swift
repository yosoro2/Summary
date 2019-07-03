//
//  LoginViewController.swift
//  Summary
//
//  Created by jieerma on 2019/6/24.
//  Copyright © 2019年 yosoro. All rights reserved.
//

import UIKit
import SVProgressHUD
import RealmSwift

class LoginViewController: UIViewController {
    let realm = try! Realm()
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func loginbutton(_ sender: UIButton) {
        SVProgressHUD.show()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            BmobUser.loginInbackground(withAccount: self.username.text!, andPassword: self.password.text!){
                (user,error) in
                if self.username.text!.isEmpty{
                    print("登录框输入为空")
                    let tip = UIAlertController(title: "提示", message: "账号输入框输入为空，请重新输入", preferredStyle: .alert)
                    let button = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    tip.addAction(button)
                    self.present(tip, animated: true, completion: nil)
                    SVProgressHUD.dismiss()
                }else if self.password.text!.isEmpty {
                    print("密码框输入为空")
                    let tip = UIAlertController(title: "提示", message: "密码输入框输入为空，请重新输入", preferredStyle: .alert)
                    let button = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    tip.addAction(button)
                    self.present(tip, animated: true, completion: nil)
                    SVProgressHUD.dismiss()
                } else if error != nil{
                    print(error!.localizedDescription)
                    let tip = UIAlertController(title: "提示", message: "登录出错，可能账号或密码出现误差，请重新输入后登录", preferredStyle: .alert)
                    let button = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    tip.addAction(button)
                    self.present(tip, animated: true, completion: nil)
                    SVProgressHUD.dismiss()
                }else {
                    print("登录成功")
                    let date = Date()
                    date.user = self.username.text!
                    let now = NSDate()
                    date.date = now
                    self.save(date: date)
                    print(self.realm.configuration.fileURL ?? "")
                    let logintime = BmobObject(className: "Login")
                    logintime!.setObject(self.username.text, forKey: "User")
                    logintime!.setObject(now,forKey: "Date")
                    logintime?.saveInBackground{(isSuccessful , error) in
                        if error != nil {
                            print(error!.localizedDescription)
                        }else{
                            print("登录记录完成")
                        }
                    }
                    self.password.text = ""
                    SVProgressHUD.dismiss()
                    self.performSegue(withIdentifier: "OK", sender: self)
                }
            }
        }
    }
//            BmobUser.loginWithAccountAccount(inBackground: self.username.text!, password: self.password.text!){
//                (user,error) in
//                if self.username.text!.isEmpty{
//                    print("登录框输入为空")
//                    let tip = UIAlertController(title: "提示", message: "账号输入框输入为空，请重新输入", preferredStyle: .alert)
//                    let button = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                    tip.addAction(button)
//                    self.present(tip, animated: true, completion: nil)
//                    SVProgressHUD.dismiss()
//                }else if self.password.text!.isEmpty {
//                    print("密码框输入为空")
//                    let tip = UIAlertController(title: "提示", message: "密码输入框输入为空，请重新输入", preferredStyle: .alert)
//                    let button = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                    tip.addAction(button)
//                    self.present(tip, animated: true, completion: nil)
//                    SVProgressHUD.dismiss()
//                } else if error != nil{
//                    print(error!.localizedDescription)
//                    let tip = UIAlertController(title: "提示", message: "登录出错，可能账号或密码出现误差，请重新输入后登录", preferredStyle: .alert)
//                    let button = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                    tip.addAction(button)
//                    self.present(tip, animated: true, completion: nil)
//                    SVProgressHUD.dismiss()
//                }else {
//                    print("登录成功")
//                    let date = Date()
//                    date.user = self.username.text!
//                    let now = NSDate()
//                    date.date = now
//                    self.save(date: date)
//                    print(self.realm.configuration.fileURL ?? "")
//                    let logintime = BmobObject(className: "Login")
//                    logintime!.setObject(self.username.text, forKey: "User")
//                    logintime!.setObject(now,forKey: "Date")
//                    logintime?.saveInBackground{(isSuccessful , error) in
//                        if error != nil {
//                          print(error!.localizedDescription)
//                        }else{
//                            print("登录记录完成")
//                        }
//                    }
//                    self.password.text = ""
//                    SVProgressHUD.dismiss()
//                    self.performSegue(withIdentifier: "OK", sender: self)
//                }
//            }
 
    
    @IBAction func Toregister(_ sender: UIButton) {
        self.performSegue(withIdentifier: "register", sender: self)
    }
    @IBAction func Tofind(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Tofind", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func save(date:Date) {
        do{
            try realm.write {
                realm.add(date)}
            } catch  {
                print("")
            }
        }
    
      func load(){
        var data = realm.objects(Date.self)
        if data.count > 0 {
            let d = data[data.count-1]
            print(d.user)
            username.text = d.user
        }
      }
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


