//
//  ViewController.swift
//  CartAndCatalog
//
//  Created by anseungjin on 2015. 8. 20..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource, ProductCellDelegate{
    var productList : [Product]!
    var cartList : [String]! = [String]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productList = [
            Product(name: "Baseball", productPrice: 100, image: "Baseball"),
            Product(name: "Basketball", productPrice: 200, image: "Basketball"),
            Product(name: "Football", productPrice: 300, image: "Football"),
            Product(name: "Golf", productPrice: 400, image: "Golf"),
            Product(name: "Bowling", productPrice: 500, image: "Bowling"),
            Product(name: "Soccer", productPrice: 600, image: "Soccer"),
            Product(name: "Tennis", productPrice: 700, image: "Tennis"),
            Product(name: "Volleyball", productPrice: 9900, image: "Volleyball")
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return productList.count
        } else {
            return cartList.count
        }
    }
   
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "CATALOG"
        } else {
            return "CART"
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell!
        
        if indexPath.section == 0 {
            var productCell : ProductCell = tableView.dequeueReusableCellWithIdentifier("PRODUCT_CELL") as! ProductCell
        
            var product = self.productList[indexPath.row]
            
            productCell.delegate = self
            productCell.product = product
            
            productCell.productNameLabel.text = product.name ?? ""
            productCell.productPriceLabel.text = String(product.price ?? 0)
            productCell.productImageView.image = UIImage(named: product.image ?? "defualtcell")
            
            
            cell = productCell
        } else {
            var baseCell = tableView.dequeueReusableCellWithIdentifier("CART_CELL") as! UITableViewCell
            baseCell.textLabel?.text = cartList[indexPath.row]
            cell = baseCell
        }
        
        return cell
    }
    
    func onAddCard(product : Product) {
        cartList.append(product.name)
        
        tableView.reloadData()
    }


}

