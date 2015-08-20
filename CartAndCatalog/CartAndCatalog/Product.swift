//
//  Product.swift
//  CartAndCatalog
//
//  Created by anseungjin on 2015. 8. 20..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import Foundation

class Product{
    var name : String!
    var price : Int!
    var image : String!
    
    init(name : String, productPrice price : Int, image : String){
        self.name = name
        self.price = price
        self.image = image
    }
}