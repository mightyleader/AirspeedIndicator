// Playground - noun: a place where people can play

import UIKit
import Foundation
import XCPlayground

XCPlayground.XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

@objc class alertHandler: NSObject, UIAlertViewDelegate {
  
  func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
    if buttonIndex > 0 {
      
      // View things....
      let redRectangleFrame = CGRect(x: 0, y: 0, width: 200, height: 200)
      let redRectangle = UIView(frame: redRectangleFrame)
      redRectangle.backgroundColor = UIColor.redColor()
      redRectangle.setTranslatesAutoresizingMaskIntoConstraints(false)
      XCPShowView("Red Rectangle", redRectangle)
      
      // Alert view things...
      let recevingAlertView = alertView
      let text = alertView.textFieldAtIndex(0)?.text
      println("\(text!)")
      println("Button \(buttonIndex)")
    }
  }
}

let anAlertHandler = alertHandler()

let status = "Hey there!"
let message = "Do you have a moment to talk about our Lord and Saviour, Cthulhu?"
let cancel = "Sounds wierd"
let ok = "Oooh! Yes"

let alert = UIAlertView(title: status,
                      message: message,
                     delegate: anAlertHandler,
            cancelButtonTitle: cancel,
            otherButtonTitles: ok)
alert.alertViewStyle = UIAlertViewStyle.PlainTextInput

alert.show()

XCPShowView("Alert", alert)



