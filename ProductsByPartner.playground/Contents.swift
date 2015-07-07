//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

public func getPartners()
{
    let urlAsString = "http://noths.com/api/partners/"
    let partnerURL  = NSURL(string: urlAsString)
    
    let partnerRequest = configuredURLRequestForURL(partnerURL!)
    let session        = nothsDefaultURLSession()
    let fetchProductsTask = session.dataTaskWithRequest(partnerRequest) { (data, response, error) -> Void in
        var anError: NSError? = nil
        let jsonOutput = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &anError) as! NSDictionary
    
        let subArray = jsonOutput["partners"] as! NSArray
        var nameArray = [String]()
        for partnerDict in subArray {
            let name = partnerDict["shortcode"] as! String
            nameArray.append(name)
        }
        nameArray
    }
    fetchProductsTask.resume()
}

getPartners()

