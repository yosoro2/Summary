//
//  CurriculumTableViewController.swift
//  BigHomeWork
//
//  Created by jieerma on 2019/1/15.
//  Copyright © 2019年 jieerma. All rights reserved.
//

import UIKit

class CurriculumTableViewController: UITableViewController {
    
    var curriculumData: [[Dictionary<String, String>]] = []
    var curriculumSections: [String] = []
    
    func createCurriculumData() {
        var Chinese: [Dictionary<String,String>] = []
        Chinese.append(["name":"古代汉语", "image":"Chinese1", "url":"https://m.open.163.com/movie?plid=MDNMO9891&rid=MDNMTERFP", "type":"文学","source":"北京大学"])
        Chinese.append(["name":"金融学", "image":"Chinese2", "url":"https://m.open.163.com/movie?plid=MDPKBA5ML&rid=MDPKBF3FU", "type":"经济","source":"中央财经大学"])
        Chinese.append(["name":"西方哲学史","image":"Chinese3", "url":"https://m.open.163.com/movie?plid=MDPKBU7EU&rid=MDPKCG0JR", "type":"哲学,历史","source":"武汉大学"])
        Chinese.append(["name":"文艺复兴美术史","image":"Chinese4", "url":"https://m.open.163.com/movie?plid=MDT870OOM&rid=MDT89JE36", "type":"艺术","source":"哈尔冰工业大学"])
        Chinese.append(["name":"货币金融学","image":"Chinese5", "url":"https://m.open.163.com/movie?plid=MDPS0AQS5&rid=MDPS157RK", "type":"经济","source":"中南大学"])
        
        var Foreign: [Dictionary<String,String>] = []
        Foreign.append(["name":"古代中世纪史", "image":"Foreign1", "url":"https://m.open.163.com/movie?plid=M99VHN7G4&rid=M9A00VMQG", "type":"历史","source":"可汗学院"])
        Foreign.append(["name":"编译原理", "image":"Foreign2", "url":"https://m.open.163.com/movie?plid=MDOV7906I&rid=MDOV8DDAA", "type":"计算机","source":"斯坦福大学"])
        Foreign.append(["name":"伟大作家的启迪","image":"Foreign3", "url":"https://m.open.163.com/movie?plid=MCP9DR4M5&rid=MCPOU67GT", "type":"文学","source":"牛津大学"])
        Foreign.append(["name":"人工智能","image":"Foreign4", "url":"https://m.open.163.com/movie?plid=MCTMNN3UI&rid=MCTMNR8QS", "type":"科技","source":"麻省理工学院"])
        Foreign.append(["name":"头脑战争","image":"Foreign5", "url":"https://m.open.163.com/movie?plid=M7Q4ATFP0&rid=M7QGP7DO7", "type":"社会","source":"哈佛大学"])
        
        curriculumData.append(Chinese)
        curriculumData.append(Foreign)
        
        curriculumSections = ["国内","国外"]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        createCurriculumData()
        tableView.rowHeight = 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return curriculumSections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let curriculumsInSection = curriculumData[section]
        return curriculumsInSection.count
    }

    //设置类别标题漫画 or 名著
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return curriculumSections[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "curriculumCell")  as! CurriculumTableViewCell
        let row = indexPath.row
        let section = indexPath.section
        
        let curriculumsInSection = curriculumData[section]
        let curriculum = curriculumsInSection[row]
        let imageName = curriculum["image"]!
        
        cell.curriculumName.text = curriculum["name"]
        cell.curriculumSource.text = curriculum["source"]
        cell.curriculumType.text = curriculum["type"]
        cell.curriculumImage.image = UIImage(named: imageName)
        
        cell.accessoryType = .disclosureIndicator
        cell.curriculumImage.layer.cornerRadius = 4
        cell.curriculumImage.clipsToBounds = true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "curriculumShowDetail", sender: self)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let c = UIAlertController(title: "删除课程", message: "您是否要将课程删除", preferredStyle: .alert)
            let alter2 = UIAlertAction(title: "否", style: .cancel, handler: nil)
            let alter = UIAlertAction(title: "是", style: .destructive, handler: {action in
                let section = indexPath.section
                let row  = indexPath.row
                self.curriculumData[section].remove(at: row)
                tableView.deleteRows(at: [indexPath], with: .automatic)}
            )
            c.addAction(alter2)
            c.addAction(alter)
            present(c,animated: true,completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "curriculumShowDetail"{
            //获取转场目标
            let detailVC = segue.destination as! CurriculumViewController
            //获取当前所选行的indexPath
            if let indexPath = tableView.indexPathForSelectedRow{
                
                let section = indexPath.section
                let row = indexPath.row
                
                let curriculumsInSection = curriculumData[section]
                let curriculum = curriculumsInSection[row]
                
                detailVC.curriculumName = curriculum["name"]!
                detailVC.curriculumUrl = curriculum["url"]!
            }
        }
    }
    
}
