//
//  ProductManager.swift
//  CartAndCatalog2
//
//  Created by dev.bamssong on 2015. 8. 24..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import Foundation


func ProductMake(product : Product) -> Product {
    var resultProduct = Product()

    resultProduct.id = product.id
    resultProduct.name = product.name
    resultProduct.price = product.price
    resultProduct.image = product.image
    resultProduct.count = product.count

    return resultProduct
}

class ProductManager {
    
    class var sharedManager : ProductManager {
        struct Instance {
            static var instance : ProductManager!
        }
        
        if Instance.instance == nil {
            Instance.instance = ProductManager()
        }
        
        return Instance.instance
    }
    
    let productList = [
            Product(id : 1, name: "Baseball", productPrice: 100, image: "Baseball"),
            Product(id : 2, name: "Basketball", productPrice: 200, image: "Basketball"),
            Product(id : 3, name: "Football", productPrice: 300, image: "Football"),
            Product(id : 4, name: "Golf", productPrice: 400, image: "Golf"),
            Product(id : 5, name: "Bowling", productPrice: 500, image: "Bowling"),
            Product(id : 6, name: "Soccer", productPrice: 600, image: "Soccer"),
            Product(id : 7, name: "Tennis", productPrice: 700, image: "Tennis"),
            Product(id : 8, name: "Volleyball", productPrice: 9900, image: "Volleyball")
        ]
    
    //var cartList : Array<Array<Product>> = Array<Array<Product>>()
    var cartList = [Cart]()
    
    
    init() {

    }
    
    
    func countForCart() -> Int {
        return cartList.count
    }
    
    func countForProduct() -> Int {
        return productList.count
    }
    
    
    func getProduct(index : Int) -> Product? {
        if(0 > index || productList.count <= index) {
            return nil
        }
        
        return productList[index]
    }
    
    func removeCart(#product : Product) -> Void {
        var removeCartIndex = -1
        for index in 0 ..< cartList.count {
            var cart = cartList[index]
            if cart.productList[0].id == product.id {
                cart.productList.removeLast()
                if cart.productList.isEmpty {
                    removeCartIndex = index
                }
            }
        }
        
        if removeCartIndex != -1 {
            cartList.removeAtIndex(removeCartIndex)
        }

    }
    
    
    func addCart(#product : Product) -> Void {
        var newItem = true
        for cart in cartList {
            if(cart.productList[0].id == product.id) {
                cart.productList.append(product)
                newItem = false
            }
        }
        
        if newItem {
            let cart = Cart()
            cart.productList.append(product)
            cartList.append(cart)
        }
    }
    
    func getTotalProductInCart(cartIndex index : Int) -> Product {
        var cart = cartList[index]
        
        var resultProduct = ProductMake(cart.productList[0])
        
        var count = cart.productList.count
        for var index = 1; index < count; ++index {
            resultProduct.price = resultProduct.price + cart.productList[index].price
            resultProduct.count = resultProduct.count + 1
        }
        
        return resultProduct
    }
    
    func getProductInCart(cartIndex index : Int) -> Product {
        var resultProduct = cartList[index].productList[0]
        
        return resultProduct
    }
}