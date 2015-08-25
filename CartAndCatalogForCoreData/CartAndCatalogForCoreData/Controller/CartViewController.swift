//
//  CartViewController.swift
//  CartAndCatalog2
//
//  Created by dev.bamssong on 2015. 8. 24..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class CartViewController: UIViewController ,UITableViewDataSource, CartCellDelegate{
    var productManager = ProductManager.sharedManager
    @IBOutlet weak var tableVew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        productManager.resolveAllCart()
        tableVew.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productManager.countForCart()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : CartCell = tableView.dequeueReusableCellWithIdentifier("CART_CELL") as! CartCell
        var cart = productManager.cartList[indexPath.row]
        
        cell.delegate = self
        cell.productId = cart.id.toInt()
        
        cell.productName.text = cart.name ?? ""
        cell.productImage.image = UIImage(named: cart.image ?? "defualtcell")
        
        //total
        let price = cart.price.toInt()!
        let count = cart.count.toInt()!
        cell.productPrice.text = String(price * count ?? 0)
        cell.productCount.text = String(count ?? 0)
        
        return cell
    }
    
    // MARK: - CartCellDelegate
    func increaseProduct(productId : Int) {
        productManager.increaseProduct(productId)
        productManager.resolveAllCart()
        tableVew.reloadData()
    }
    
    func decreaseProduct(productId : Int) {
        productManager.decreaseProduct(productId)
        productManager.resolveAllCart()
        tableVew.reloadData()
    }

}
