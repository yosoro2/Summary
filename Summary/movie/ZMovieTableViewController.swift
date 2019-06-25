//
//  ZMovieTableViewController.swift
//  BigHomeWork
//
//  Created by jieerma on 2019/1/12.
//  Copyright © 2019年 jieerma. All rights reserved.
//

import UIKit

class ZMovieTableViewController: UITableViewController {
    var movieData: [[Dictionary<String, String>]] = []
    var movieSections: [String] = []
    
    func createMovieData() {
        var Masterpiece: [Dictionary<String,String>] = []
        Masterpiece.append(["name":"暴裂无声", "image":"movie1", "url":"https://movie.douban.com/subject/26647117/","director":"忻钰坤","type":"电影"])
        Masterpiece.append(["name":"一个勺子", "image":"movie2", "url":"https://movie.douban.com/subject/25926267/","director":"陈建斌","type":"电影"])
        Masterpiece.append(["name":"追龙","image":"movie3", "url":"https://movie.douban.com/subject/26425068/","director":"王晶 / 关智耀","type":"电影"])
        Masterpiece.append(["name":"大腕","image":"movie4", "url":"https://movie.douban.com/subject/1304022/","director":"冯小刚","type":"电影"])
        Masterpiece.append(["name":"买凶拍人","image":"movie5", "url":"https://movie.douban.com/subject/1300616/","director":"彭浩翔","type":"电影"])
        
        var Cartoon: [Dictionary<String,String>] = []
        Cartoon.append(["name":"盗梦空间 Inception", "image":"movie6", "url":"https://movie.douban.com/subject/3541415/","director":" 克里斯托弗·诺兰","type":"电影"])
        Cartoon.append(["name":"三傻大闹宝莱坞 3 Idiots", "image":"movie7", "url":"https://movie.douban.com/subject/3793023/","director":"拉吉库马尔·希拉尼","type":"电影"])
        Cartoon.append(["name":"千谎百计 第一季 Lie to Me Season 1","image":"movie8", "url":"https://movie.douban.com/subject/3103678/","director":"罗伯特·斯文克 / 亚当·戴维森","type":"电视剧"])
        Cartoon.append(["name":"犯罪心理 第一季 Criminal Minds Season 1","image":"movie9", "url":"https://movie.douban.com/subject/1427816/", "director":"Charles Haid / Chris Long","type":"电视剧"])
        Cartoon.append(["name":"电锯惊魂 Saw","image":"movie10", "url":"https://movie.douban.com/subject/1417598/", "director":"温子仁","type":"电影"])
        
        movieData.append(Masterpiece)
        movieData.append(Cartoon)
        
        movieSections = ["国内", "外国"]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        createMovieData()
        tableView.rowHeight = 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return movieSections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let movieInSection = movieData[section]
        return movieInSection.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return movieSections[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell")  as! ZMovieTableViewCell
        let row = indexPath.row
        let section = indexPath.section
        
        let movieInSection = movieData[section]
        let movie = movieInSection[row]
        let imageName = movie["image"]!
        
        cell.Name.text = movie["name"]
        cell.Url.text = movie["director"]
        cell.Breed.text = movie["type"]
        cell.MovieImage.image = UIImage(named: imageName)
        
        cell.accessoryType = .disclosureIndicator
        cell.MovieImage.layer.cornerRadius = 4
        cell.MovieImage.clipsToBounds = true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "movieShowDetail", sender: self)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //删除数组中的数据
            let d = UIAlertController(title: "电影将被移除", message: "是否将这部电影移除", preferredStyle: .alert)
            let n = UIAlertAction(title: "否", style: .cancel, handler: nil)
            let y = UIAlertAction(title: "是", style: .destructive, handler: {action in
                let section = indexPath.section
                let row  = indexPath.row
                self.movieData[section].remove(at: row)
                //删除单元格
                tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            d.addAction(n)
            d.addAction(y)
            present(d,animated: true,completion: nil)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieShowDetail"{
          
            let detailVC = segue.destination as! ZDetailViewController

            if let indexPath = tableView.indexPathForSelectedRow{
                
                let section = indexPath.section
                let row = indexPath.row
                
                let movieInSection = movieData[section]
                let movie = movieInSection[row]
                
                detailVC.movieName = movie["name"]!
                detailVC.movieUrl = movie["url"]!
            }
        }
    }
   
}
