//
//  ProductManager.swift
//  CartAndCatalog2
//
//  Created by dev.bamssong on 2015. 8. 24..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit
import CoreData

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
    
    func resolveAllCart() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext!
        
        let request = NSFetchRequest(entityName: "Cart")
        var error : NSError?
        
        let sort = NSSortDescriptor(key: "id", ascending: true)
        
        if let ret = context.executeFetchRequest(request, error: &error) {
            cartList = ret as! [Cart]
        } else {
            println("error \(error?.localizedDescription)")
        }
    }
    
    func addCart(#product : Product) -> Void {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext!
        
        
        if false == increaseProduct(product.id) {
            //insert.
            let cart =  NSEntityDescription.insertNewObjectForEntityForName("Cart", inManagedObjectContext: context) as! Cart
            
            cart.id = String(product.id)
            cart.name = product.name
            cart.price = String(product.price)
            cart.image = product.image
            cart.count = String(product.count)
            
            var error : NSError?
            if false == context.save(&error) {
                println("error. \(error?.localizedDescription)")
            }
        }
    }
    
   
    
    func increaseProduct(productId : Int) -> Bool{
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext!
        
        let request = NSFetchRequest(entityName: "Cart")
        let predicate = NSPredicate(format: "id = %i",productId)
        request.predicate = predicate
        
        var error : NSError?
        if let ret = context.executeFetchRequest(request, error: &error) {
            var cartList = ret as! [Cart]
            
            if cartList.count > 0 {
                var cart = cartList[0]
                
                cart.count = String(cart.count.toInt()! + 1)
                //let context = cart.managedObjectContext!
                var error : NSError?
                let ret = context.save(&error)
                if false == ret {
                    println("\(error?.localizedDescription)")
                }
                
                return ret
            }
        } else {
            println("error \(error?.localizedDescription)")
        }
        
        return false
    }
    
    func decreaseProduct(productId : Int) -> Bool {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext!
        
        let request = NSFetchRequest(entityName: "Cart")
        let predicate = NSPredicate(format: "id = %i",productId)
        request.predicate = predicate
        
        var error : NSError?
        if let ret = context.executeFetchRequest(request, error: &error) {
            var cartList = ret as! [Cart]

            if cartList.count > 0 {
                var cart = cartList[0]
                var count = cart.count.toInt()!
                if count == 1 {//하나 남으면 지운다.
                    context.deleteObject(cart)
                } else {
                    cart.count = String(count - 1)
                }
                
                var error : NSError?
                let ret = context.save(&error)
                if false == ret {
                    println("\(error?.localizedDescription)")
                }
                
                return ret
            }
        } else {
            println("error \(error?.localizedDescription)")
        }
        
        return false;
    }
    
}