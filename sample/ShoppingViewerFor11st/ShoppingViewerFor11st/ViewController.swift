//
//  ViewController.swift
//  ShoppingViewerFor11st
//
//  Created by dev.bamssong on 2015. 8. 26..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        let searchWord = searchBar.text
        println(searchWord)
        
        searchBar.resignFirstResponder()
        
        ProductManager.sharedManager.searchProduct(search: searchWord) { (result, error) -> Void in
            if error == nil {
                ProductManager.sharedManager.products.removeAll(keepCapacity: false)
                
                let products = result["ProductSearchResponse","Products","Product"]
                for (key, product) in products {
                    let productName = product["ProductName"].string ?? ""
                    let ProductPrice = product["ProductPrice"].int ?? 0
                    let ProductImage100 = product["ProductImage100"].string ?? "defaultImage"
                    let DetailPageUrl = product["DetailPageUrl"].string ?? "http://www.11st.co.kr/html/main.html"
                    
                    ProductManager.sharedManager.products.append((productName,ProductPrice,ProductImage100,DetailPageUrl))
                }
                
                self.tableView.reloadData()
            } else {
                println(error)
                self.showNotiDialog("네트워크 에러", message: "잠시 후 다시 시도해주세요.")
            }
        }
    }


    func showNotiDialog(title : String, message : String){
        let dialog = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.Default, handler: {(action) -> Void in println("ok")})
        
        dialog.addAction(okAction)
        self.presentViewController(dialog, animated: true, completion: nil)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductManager.sharedManager.products.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : ProductCell = tableView.dequeueReusableCellWithIdentifier("PRODUCT_CELL") as! ProductCell
        var product = ProductManager.sharedManager.products[indexPath.row]
        
        
        cell.productNameLabel.text = product.0 ?? ""
        cell.productPriceLabel.text = String(product.1) ?? "0"
        
        if let url = NSURL(string: product.2) {
            if let data = NSData(contentsOfURL: url) {
                cell.productImageView.image = UIImage(data: data)
            }
        } else {
            cell.productImageView.image = UIImage(named: "defaultImage")
        }
        
        
        return cell
    }

     
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DETAIL_SEGUE" {
            if let vc = segue.destinationViewController as? DetailViewController {
                if let index = tableView.indexPathForSelectedRow()?.row {
                    var product = ProductManager.sharedManager.products[index]
                    vc.detailUrl = product.3
                }
            }
        }
    }

    
    
    
    
}

