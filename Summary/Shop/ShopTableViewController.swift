//
//  ShopTableViewController.swift
//  my collection
//
//  Created by yosoro on 2019/1/13.
//  Copyright © 2019 yosoro. All rights reserved.
//

import UIKit

class ShopTableViewController: UITableViewController {
    var ShopData: [[Dictionary<String, String>]] = []
    var ShopSections: [String] = []
    
    @IBOutlet var tableview: UITableView!
    func createShowData() {
        var Phone: [Dictionary<String,String>] = []
        Phone.append(["name":"Iphone XS Max", "image":"s2", "price":"¥10999.00","url":"https://item.jd.com/100000287113.html", "address":"Apple产品自营旗舰店"])
        Phone.append(["name":"Iphone XR", "image":"s3", "price":"¥6999.00","url":"https://item.jd.com/100000177770.html", "address":"Apple产品自营旗舰店"])
      Phone.append(["name":"荣耀magic2", "image":"s4", "price":"¥3799.00","url":"https://item.jd.com/100001364184.html", "address":"荣耀自营旗舰店"])
        Phone.append(["name":"HTC U11+", "image":"s5","price":"¥4299.00", "url":"https://item.jd.com/5412113.html#crumb-wrap", "address":"HTC手机自营旗舰店"])
        Phone.append(["name":"努比亚红魔Marss电竞手机", "image":"s1", "price":"¥3199.00","url":"https://item.jd.com/100002069408.html", "address":"努比亚自营旗舰店"])
        Phone.append(["name":"索尼XperiaXZ3", "image":"s6", "price":"¥5199.00","url":"https://item.jd.com/100000766579.html", "address":"索尼自营旗舰店"])
        Phone.append(["name":"魅族16th", "image":"s7","price":"¥2498.00", "url":"https://item.jd.com/8535863.html", "address":"魅族自营旗舰店"])
        
        var Earphone: [Dictionary<String,String>] = []
        Earphone.append(["name":"苹果AirPods", "image":"se1","price":"¥1299.00", "url":"https://item.jd.com/3563660.html", "address":"Apple产品自营旗舰店"])
        Earphone.append(["name":"索尼WH-1000XM3", "image":"se2","price":"¥2698.00", "url":"https://item.jd.com/100000998920.html", "address":"索尼自营旗舰店"])
        Earphone.append(["name":"Beats Studio3 Wireless", "image":"se3","price":"¥2488.00", "url":"https://item.jd.com/5051647.html", "address":"Beats自营旗舰店"])
        Earphone.append(["name":"漫步者W800BT ", "image":"se4","price":"¥179", "url":"https://item.jd.com/3819956.html", "address":"漫步者自营旗舰店"])
        Earphone.append(["name":"森海塞尔 HD 4.50BTNC", "image":"se5","price":"¥999", "url":"https://item.jd.com/100000287113.html", "address":"森海塞尔自营旗舰店"])
        
        ShopData.append(Phone)
        ShopData.append(Earphone)
        
        ShopSections = ["手机", "耳机"]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createShowData()
        tableview.rowHeight = 90
         navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return ShopSections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = ShopData[section]
        return rows.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopcell", for: indexPath) as! ShopTableViewCell
        let section = indexPath.section
        let row = indexPath.row
        let shopsection = ShopData[section]
        let shop = shopsection[row]
        cell.shopname.text = shop["name"]
        cell.shopprice.text = shop["price"]
        cell.shopaddress.text = shop["address"]
        cell.shopimage.image = UIImage(named: shop["image"]!)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ShopSections[section]
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "shopdetails", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let c = UIAlertController(title: "删除物品", message: "您是否删除本件物品", preferredStyle: .alert)
            let alter2 = UIAlertAction(title: "否", style: .cancel, handler: nil)
            let alter = UIAlertAction(title: "是", style: .destructive, handler: {action in
            let section = indexPath.section
            let row  = indexPath.row
                self.ShopData[section].remove(at: row)
                tableView.deleteRows(at: [indexPath], with: .automatic)}
            )
            c.addAction(alter2)
            c.addAction(alter)
            present(c,animated: true,completion: nil)
            /*let section = indexPath.section
            let row  = indexPath.row
            ShopData[section].remove(at: row)
            tableView.deleteRows(at: [indexPath], with: .automatic);*/
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "shopdetails" {
            let detailVC = segue.destination as! ShopWebViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                let section = indexPath.section
                let row = indexPath.row
                let shopInSection = ShopData[section]
                let shop = shopInSection[row]
                detailVC.shopName = shop["name"]!
                detailVC.shopUrl = shop["url"]!
            }
    }
  }
}
