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
        tableVew.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productManager.countForCart()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : CartCell = tableView.dequeueReusableCellWithIdentifier("CART_CELL") as! CartCell
        var product = productManager.getProductInCart(cartIndex : indexPath.row)
        
        cell.delegate = self
        cell.product = product
        
        var totalProduct = productManager.getTotalProductInCart(cartIndex: indexPath.row)
        cell.productName.text = totalProduct.name ?? ""
        cell.productPrice.text = String(totalProduct.price ?? 0)
        cell.productImage.image = UIImage(named: totalProduct.image ?? "defualtcell")
        cell.productCount.text = String(totalProduct.count ?? 0)
        
        return cell
    }
    
    // MARK: - CartCellDelegate
    func addProduct(product : Product) {
        productManager.addCart(product: product)
        
        tableVew.reloadData()
    }
    
    func removeProduct(product : Product) {
        productManager.removeCart(product: product)
        
        tableVew.reloadData()
    }

}
