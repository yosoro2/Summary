//
//  RegisterViewController.swift
//  Summary
//
//  Created by jieerma on 2019/6/24.
//  Copyright © 2019年 yosoro. All rights reserved.
//

import UIKit
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBAction func closeShowGirl(segue:UIStoryboardSegue){
        SVProgressHUD.show()
        let user = BmobUser()
        user.username = usernameText.text!
        user.password = passwordText.text!
        user.email = emailText.text!
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
        user.signUpInBackground{(isSuccessful,error) in
            if self.usernameText.text!.isEmpty{
                print("登录框输入为空")
                let tip = UIAlertController(title: "提示", message: "账号输入框输入为空，请重新输入", preferredStyle: .alert)
                let button = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                tip.addAction(button)
                self.present(tip, animated: true, completion: nil)
                SVProgressHUD.dismiss()
            }else if self.passwordText.text!.isEmpty {
                print("密码框输入为空")
                let tip = UIAlertController(title: "提示", message: "密码输入框输入为空，请重新输入", preferredStyle: .alert)
                let button = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                tip.addAction(button)
                self.present(tip, animated: true, completion: nil)
                SVProgressHUD.dismiss()
            }else if self.emailText.text!.isEmpty && isSuccessful {
                
                print("注册成功,")
                SVProgressHUD.dismiss()
                //self.performSegue(withIdentifier: "goToChat", sender: self)
                self.presentingViewController!.dismiss(animated: true, completion: nil)
            }else if isSuccessful && !self.emailText.text!.isEmpty{
                print("注册成功.")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToHome", sender: self)
                //self.presentingViewController!.dismiss(animated: true, completion: nil)
            }else{
                print("注册失败，错误原因：\(error!.localizedDescription)")
                let tip = UIAlertController(title: "提示", message: "注册出现错误，本账号可能已被注册，请重新输入", preferredStyle: .alert)
                let button = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                tip.addAction(button)
                self.present(tip, animated: true, completion: nil)
                SVProgressHUD.dismiss()
            }
        
    }
        }
}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}