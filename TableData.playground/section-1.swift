
import UIKit
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

// a struct to keep each product with immutable members
struct Product {
  let id: String
  let title: String
  let subtitle: String
  let description: String
}

class ProductCreator {
  //Properties
  var datasource = TableData?()
  var tableview: UITableView? //Not mad about having to have this but required in the playground environment
  
  // MARK: JSON Download & parsing

  // Code to make Product structs from a Dictionary :)
  func jsonProcessor(jsonData: [String: [String: AnyObject]]) {
    var workingArray = [Product]()
    for (productID, productDict) in jsonData {
      if let
         id = productID as String?,
        title = productDict["title"] as? String,
        subtitle = productDict["subtitle"] as? String,
        description = productDict["description"] as? String
      {
        let newProduct = Product(id: id, title: title, subtitle: subtitle, description: description)
        workingArray.append(newProduct)
      }
    }
    if let ds = self.datasource {
      ds.datasource = workingArray
    }
    self.tableview?.reloadData()
    tableview
  }
  
  // block to handle return of data from NSURLSession
  func jsonHandler(data:NSData!, response:NSURLResponse!, error:NSError!) {
    if (error != nil) {
      println("Problem: \(error!)")
    }
    else {
      let products = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil) as? [String: [String: AnyObject]]
      if let output = products {
        self.jsonProcessor(output)
      }
    }
  }
  
  // fetch! good function
  func fetchData(#string: String) {
    var sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
    var url = NSURL(string: string)
    var session = NSURLSession(configuration: sessionConfig)
    var downloadTask: NSURLSessionDataTask = session.dataTaskWithURL(url!, completionHandler: jsonHandler)
    downloadTask.resume()
  }
  
}

class TableData: NSObject, UITableViewDataSource {
  //Properties...
  let reuseID = "productCell" //immutable
  var datasource = [Product]()
  
  // MARK:  tableview  datasource methods...
  
  @objc func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: reuseID)
    //tableView.dequeueReusableCellWithIdentifier(reuseID, forIndexPath: indexPath) as! UITableViewCell
    cell.textLabel?.text = self.datasource[indexPath.row].title
    cell.detailTextLabel?.text = self.datasource[indexPath.row].id
    cell.textLabel?.textColor = UIColor.blueColor()
    cell.detailTextLabel?.textColor = UIColor.grayColor()
    return cell
  }
  
  @objc func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.datasource.count
  }
  
  @objc func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
}

//**** MAIN PROGRAM ****
let tableData = TableData()
let productCreator = ProductCreator()
productCreator.datasource = tableData

let tableFrame = CGRect(x: 0, y: 0, width: 300, height: 400) //immutable
let tableView: UITableView? = UITableView(frame: tableFrame, style: UITableViewStyle.Plain)
tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: tableData.reuseID)
tableView?.dataSource = tableData
productCreator.tableview = tableView

let stringOfURL = "http://demo.pugpig.com/kgproducttesting/products.json"
productCreator.fetchData(string: stringOfURL)





