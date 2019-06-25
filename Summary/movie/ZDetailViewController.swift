//
//  ZDetailViewController.swift
//  BigHomeWork
//
//  Created by jieerma on 2019/1/12.
//  Copyright © 2019年 jieerma. All rights reserved.
//

import UIKit
import WebKit
class ZDetailViewController: UIViewController {

    @IBOutlet weak var WebView: WKWebView!
    var movieName = ""
    var movieUrl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        //在标题上显示花名
        navigationItem.title = movieName
        //取消大标题
        navigationItem.largeTitleDisplayMode = .never
        //显示花的介绍页面
        //创建网址
        let url = URL(string:movieUrl)
        //创建网页请求
        let requst = URLRequest(url: url!)
        //加载请求
        WebView.load(requst)


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
