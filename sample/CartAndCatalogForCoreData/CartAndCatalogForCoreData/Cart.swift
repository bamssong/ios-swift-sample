//
//  Cart.swift
//  CartAndCatalogForCoreData
//
//  Created by dev.bamssong on 2015. 8. 25..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import Foundation
import CoreData

class Cart: NSManagedObject {

    @NSManaged var image: String
    @NSManaged var price: String
    @NSManaged var count: String
    @NSManaged var name: String
    @NSManaged var id: String

}
