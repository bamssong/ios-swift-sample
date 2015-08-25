//
//  ProductCell.swift
//  CartAndCatalog
//
//  Created by dev.bamssong on 2015. 8. 20..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

protocol ProductCellDelegate : class {
    func onAddCart(product : Product)
}

class ProductCell: UITableViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    weak var delegate : ProductCellDelegate!
    weak var product : Product!
    @IBAction func addButtonClicked(sender: UIButton) {
        if delegate != nil {
            delegate.onAddCart(product)
        }
    }
    
}
