//
//  CartCell.swift
//  CartAndCatalog2
//
//  Created by dev.bamssong on 2015. 8. 25..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit


protocol CartCellDelegate : class {
    func increaseProduct(productId : Int)
    func decreaseProduct(productId : Int)
}

class CartCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productCount: UILabel!
    
    var productId : Int!
    var delegate : CartCellDelegate!
    
    @IBAction func addProduct(sender: UIButton) {
        if delegate != nil {
            delegate.increaseProduct(productId)
        }
    }
    
    @IBAction func removeProduct(sender: UIButton) {
        if delegate != nil {
            delegate.decreaseProduct(productId)
        }
    }
}
