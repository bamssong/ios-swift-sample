//
//  CatalogViewController.swift
//  CartAndCatalog2
//
//  Created by dev.bamssong on 2015. 8. 24..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit



class CatalogViewController: UIViewController , UITableViewDataSource ,ProductCellDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var productManager = ProductManager.sharedManager
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - ProductCellDelegate
    func onAddCart(product : Product) {
        productManager.addCart(product: product)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productManager.countForProduct()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : ProductCell = tableView.dequeueReusableCellWithIdentifier("PRODUCT_CELL") as! ProductCell
        var product = productManager.getProduct(indexPath.row)!
        
        cell.delegate = self
        cell.product = product
        
        cell.productNameLabel.text = product.name ?? ""
        cell.productPriceLabel.text = String(product.price ?? 0)
        cell.productImageView.image = UIImage(named: product.image ?? "defualtcell")

        return cell
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("prepareForSegue!!")
        if segue.identifier == "DETAIL_SEGUE" {
            if let vc = segue.destinationViewController as? DetailViewController {
                if let index = tableView.indexPathForSelectedRow()?.row {
                    if let product = productManager.getProduct(index) {
                        vc.productName = product.name
                    }
                }
            }
        }
    }
    

}
