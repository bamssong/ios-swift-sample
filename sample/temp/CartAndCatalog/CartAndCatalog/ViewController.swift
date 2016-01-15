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
    var cartList : Dictionary<Int,[Product]> = Dictionary<Int,[Product]>()
    var addCartProductId : Int?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productList = [
            Product(id : 1, name: "Baseball", productPrice: 100, image: "Baseball"),
            Product(id : 2, name: "Basketball", productPrice: 200, image: "Basketball"),
            Product(id : 3, name: "Football", productPrice: 300, image: "Football"),
            Product(id : 4, name: "Golf", productPrice: 400, image: "Golf"),
            Product(id : 5, name: "Bowling", productPrice: 500, image: "Bowling"),
            Product(id : 6, name: "Soccer", productPrice: 600, image: "Soccer"),
            Product(id : 7, name: "Tennis", productPrice: 700, image: "Tennis"),
            Product(id : 8, name: "Volleyball", productPrice: 9900, image: "Volleyball")
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
            var cartCell = tableView.dequeueReusableCellWithIdentifier("CART_CELL") as! UITableViewCell
            let imageView = cartCell.viewWithTag(1) as! UIImageView
            let productName = cartCell.viewWithTag(2) as! UILabel
            let productPrice = cartCell.viewWithTag(3) as! UILabel
            let removeButton = cartCell.viewWithTag(4) as! UIButton
            let appendButton = cartCell.viewWithTag(5) as! UIButton
            
            if let id = addCartProductId {
                if let item = cartList[id] {
                    imageView.image = UIImage(named: item[0].name)
                    productName.text = item[0].name
                    
                    var totalPrice = 0
                    for product in item {
                        totalPrice += product.price
                    }
                    productPrice.text = String(totalPrice)
                    
                    removeButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
                }
            }
            cell = cartCell
        }
        
        return cell
    }
    
    func onAddCard(product : Product) {
        
        let id = product.id
        if (cartList[id] != nil) {
            cartList[id]?.append(product)
        } else {
            cartList[id] = [product]
            addCartProductId = id
        }
        
        tableView.reloadData()
        //tableView.reloadRowsAtIndexPaths(<#indexPaths: [AnyObject]#>, withRowAnimation: <#UITableViewRowAnimation#>)
        //tableView.reloadSections(<#sections: NSIndexSet#>, withRowAnimation: <#UITableViewRowAnimation#>)

    }


}

