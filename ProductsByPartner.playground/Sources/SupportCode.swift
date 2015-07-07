//
// This file (and all other Swift source files in the Sources directory of this playground) will be precompiled into a framework which is automatically made available to ProductsByPartner.playground.
//

import UIKit;
import Foundation;

public func configuredURLRequestForURL(url: NSURL) -> NSMutableURLRequest
{
    var request = NSMutableURLRequest(URL: url)
    request.addValue("a283afb861412cd8dac0302bdf0aa8c8", forHTTPHeaderField: "X-Notonthehighstreet-Token")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.addValue("application/json", forHTTPHeaderField: "Content-type")
    request.addValue("gzip", forHTTPHeaderField: "Accept-Encoding")
    
    return request
}

public func nothsDefaultSessionConfiguration() -> NSURLSessionConfiguration
{
    var defaultConfigObject = NSURLSessionConfiguration.defaultSessionConfiguration()
    defaultConfigObject.allowsCellularAccess = true
    
    return defaultConfigObject
}

public func nothsDefaultURLSession() -> NSURLSession
{
    let configObject = nothsDefaultSessionConfiguration()
    let session      = NSURLSession(configuration: configObject)
    return session
}

//func getProductsForPartner(partner: String) -> NSDictionary
//{
//    let urlAsString = "http://noths.com/api/products"
//    let productURL  = NSURL(string: urlAsString)
//    
//    let productRequest = configuredURLRequestForURL(productURL!)
//    let session        = nothsDefaultURLSession()
//    let fetchProductsTask = session.dataTaskWithRequest(productRequest, completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)?)
//    
//    
//}
