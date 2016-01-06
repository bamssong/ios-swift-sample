//
//  ProductManager.swift
//  ShoppingViewerFor11st
//
//  Created by dev.bamssong on 2015. 8. 26..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


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
    
    var products = [(String, Int, String, String)]()
    
    
    func searchProduct(search search : String, searchResponse : (result : JSON!, error : String!) -> Void) {
        let parameters = [
            "appKey": "must need api key for https://developers.skplanetx.com",
            "format":"json",
            "count":"30",
            "page":"1",
            "sortCode":"",
            "option":"",
            "searchKeyword":"\(search)",
            "version":"1"
        ]
        
        Alamofire.request(.GET, "http://apis.skplanetx.com/11st/common/products",
            parameters: parameters)
            .responseJSON{ request, response, data, error in
         
                if error == nil {
                    searchResponse(result: JSON(data!) , error : nil)
                } else {
                    searchResponse(result: nil, error : error?.localizedDescription)
                }
        }
    }
    
}

