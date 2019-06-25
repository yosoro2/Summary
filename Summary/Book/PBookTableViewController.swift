//
//  PBookTableViewController.swift
//  BigHomeWork
//
//  Created by jieerma on 2019/1/13.
//  Copyright © 2019年 jieerma. All rights reserved.
//

import UIKit

class PBookTableViewController: UITableViewController {
    
    var bookData: [[Dictionary<String, String>]] = []
    var bookSections: [String] = []
    
    func createBookData() {
        var Masterpiece: [Dictionary<String,String>] = []
        Masterpiece.append(["name":"钢铁是怎样练成的", "image":"gangtie", "url":"https://m.douban.com/book/subject/1013502/", "type":"自传体励志小说","author":"尼古拉·奥斯特洛夫斯基"])
        Masterpiece.append(["name":"堂吉柯德", "image":"tangji", "url":"https://m.douban.com/book/subject/3483910/", "type":"现实主义小说","author":"塞万提斯"])
        Masterpiece.append(["name":"不能承受的生命之轻","image":"shengming", "url":"https://m.douban.com/book/subject/1017143/", "type":"哲理小说","author":"米兰·昆德拉"])
        Masterpiece.append(["name":"悲惨世界","image":"beican", "url":"https://m.douban.com/book/subject/1136881/", "type":"现实主义小说","author":"维克多·雨果"])
        Masterpiece.append(["name":"格列佛游记","image":"geliefoa", "url":"https://m.douban.com/book/subject/1888031/", "type":"游记体讽刺小说","author":"乔纳森·斯威夫特"])
        
        var Cartoon: [Dictionary<String,String>] = []
        Cartoon.append(["name":"老人与海", "image":"oldman", "url":"https://m.douban.com/book/subject/1064275/", "type":"励志小说","author":"海明威"])
        Cartoon.append(["name":"汤姆索亚历险记", "image":"tom", "url":"https://m.douban.com/book/subject/1142578/", "type":"现实主义小说","author":"马克·吐温"])
        Cartoon.append(["name":"夏洛克福尔摩斯","image":"fuer", "url":"http://en.wikipedia.org/wiki/SeaHolly", "type":"悬疑小说","author":"阿瑟·柯南·道尔"])
        Cartoon.append(["name":"最后一片叶子","image":"zuihou", "url":"https://m.douban.com/book/subject/1420508/", "type":"短篇小说","author":"欧·亨利"])
        Cartoon.append(["name":"海底两万里","image":"haidi", "url":"https://m.douban.com/book/subject/1085470/", "type":"长篇科幻小说","author":"儒勒·凡尔纳"])
        
        bookData.append(Masterpiece)
        bookData.append(Cartoon)
        
        bookSections = ["小说", "漫画"]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        createBookData()
        tableView.rowHeight = 100
        tableView.sectionHeaderHeight = 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return bookSections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let booksInSection = bookData[section]
        return booksInSection.count
    }

    //设置类别标题漫画 or 名著
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return bookSections[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell")  as! PBookTableViewCell
        let row = indexPath.row
        let section = indexPath.section
        
        let booksInSection = bookData[section]
        let book = booksInSection[row]
        let imageName = book["image"]!
        
        cell.bookName.text = book["name"]
        cell.bookAuthor.text = book["author"]
        cell.bookType.text = book["type"]
        cell.bookImage.image = UIImage(named: imageName)
    
        cell.accessoryType = .disclosureIndicator
        cell.bookImage.layer.cornerRadius = 4
        cell.bookImage.clipsToBounds = true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "bookShowDetail", sender: self)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //删除数组中的数据
            let d = UIAlertController(title: "书本将被移除", message: "是否将这本书移除", preferredStyle: .alert)
            let n = UIAlertAction(title: "否", style: .cancel, handler: nil)
            let y = UIAlertAction(title: "是", style: .destructive, handler: {action in
                let section = indexPath.section
                let row  = indexPath.row
                self.bookData[section].remove(at: row)
                //删除单元格
                tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            d.addAction(n)
            d.addAction(y)
            present(d,animated: true,completion: nil)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "bookShowDetail"{
            //获取转场目标
            let detailVC = segue.destination as! PBookViewController
            //获取当前所选行的indexPath
            if let indexPath = tableView.indexPathForSelectedRow{
                let section = indexPath.section
                let row = indexPath.row
                let booksInSection = bookData[section]
                let book = booksInSection[row]
                detailVC.bookName = book["name"]!
                detailVC.bookUrl = book["url"]!
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
}
