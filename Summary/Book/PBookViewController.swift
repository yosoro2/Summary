//
//  PBookViewController.swift
//  BigHomeWork
//
//  Created by jieerma on 2019/1/13.
//  Copyright © 2019年 jieerma. All rights reserved.
//

import UIKit
import WebKit
class PBookViewController: UIViewController {
    @IBOutlet weak var bookWebView: WKWebView!
    
    var bookName = ""
    var bookUrl = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        //在标题上显示花名
        navigationItem.title = bookName
        //取消大标题
        navigationItem.largeTitleDisplayMode = .never
        //显示花的介绍页面
        //创建网址
        let url = URL(string: bookUrl)
        //创建网页请求
        let requst = URLRequest(url: url!)
        //加载请求
        bookWebView.load(requst)
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
