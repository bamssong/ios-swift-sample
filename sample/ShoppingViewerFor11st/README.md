
modify : ProductManager.swift > func searchProduct > appKey value..

open api : https://developers.skplanetx.com/ 

```swift

func searchProduct(#search : String, searchResponse : (result : JSON!, error : String!) -> Void) {
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

    Alamofire.request(.GET, "http://apis.skplanetx.com/11st/common/products",parameters: parameters)
    .responseJSON{ request, response, data, error in
        if error == nil {
            searchResponse(result: JSON(data!) , error : nil)
        } else {
            searchResponse(result: nil, error : error?.localizedDescription)
        }
    }
}

```