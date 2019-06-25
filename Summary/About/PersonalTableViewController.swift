//
//  PersonalTableViewController.swift
//  BigHomeWork
//
//  Created by jieerma on 2019/1/15.
//  Copyright © 2019年 jieerma. All rights reserved.
//

import UIKit

class PersonalTableViewController: UITableViewController {
    
    var personalData: [Dictionary<String, String>] = []
    
    func createCurriculumData() {
        
        personalData.append(["name":"潘锡俊", "image":"Ptouxiang", "number":"1702040022","source":"软件技术","saying":"书到用时方恨少"])

        personalData.append(["name":"唐昕", "image":"tangxin", "number":"1702040025","source":"软件技术","saying":"乘风破浪会有时，直挂云帆济沧海"])
        
        personalData.append(["name":"周铭彦", "image":"Ptouxiang", "number":"1702040032","source":"软件技术","saying":"实践是探究真理的唯一标准"])
        
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        createCurriculumData()
        tableView.rowHeight = 200
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let c = UIAlertController(title: "无法删除", message: "组员缺一不可", preferredStyle: .alert)
            let alter2 = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            c.addAction(alter2)
            present(c,animated: true,completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personalData.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personalCell")  as! PersonalTableViewCell
        let row = indexPath.row
        let personal = personalData[row]
        let imageName = personal["image"]!
        cell.Name.text = personal["name"]
        cell.Number.text = personal["number"]
        cell.source.text = personal["source"]
        cell.Introduction.text = personal["saying"]
        cell.PImage.image = UIImage(named: imageName)
        
        cell.accessoryType = .disclosureIndicator
        cell.PImage.layer.cornerRadius = 30
        cell.PImage.clipsToBounds = true
        
        return cell
    }
    
}
