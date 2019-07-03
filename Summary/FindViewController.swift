//
//  FindViewController.swift
//  Summary
//
//  Created by yosoro on 2019/7/2.
//  Copyright © 2019 yosoro. All rights reserved.
//

import UIKit

class FindViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBAction func findpassword(_ sender: UIButton) {
        BmobUser.requestPasswordResetInBackground(withEmail: email.text!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
