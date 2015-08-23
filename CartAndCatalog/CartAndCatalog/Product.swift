//
//  Product.swift
//  CartAndCatalog
//
//  Created by anseungjin on 2015. 8. 20..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import Foundation

class Product{
    var id : Int!
    var name : String!
    var price : Int!
    var image : String!
    
    init(id : Int, name : String, productPrice price : Int, image : String){
        self.id = id
        self.name = name
        self.price = price
        self.image = image
    }
}