//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

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


public func getPartners()
{
    let urlAsString = "http://noths.com/api/partners"
    let partnerURL  = NSURL(string: urlAsString)
    
    let partnerRequest = configuredURLRequestForURL(partnerURL!)
    let session        = nothsDefaultURLSession()
    let fetchProductsTask = session.dataTaskWithRequest(partnerRequest) { (data, response, error) -> Void in
        var anError: NSError? = nil
        let jsonOutput: AnyObject? = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &anError)
        jsonOutput
        response
        error
        print(jsonOutput)
    }
    fetchProductsTask.resume()
}

getPartners()

