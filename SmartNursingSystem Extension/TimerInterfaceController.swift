//
//  TimerInterfaceController.swift
//  NursingSystem
//
//  Created by  on 12/2/16.
//  Copyright © 2016 uhcl.edu. All rights reserved.
//

import WatchKit
import Foundation


class TimerInterfaceController: WKInterfaceController {
    @IBOutlet var timer: WKInterfaceTimer!
    var showing=false
    
    @IBOutlet var statstopbutton: WKInterfaceButton!
    

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        statstopbutton.setBackgroundColor(UIColor.greenColor())
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    
    @IBAction func startStopTimerFunction() {
        if showing == false
        {
            showing=true
            statstopbutton.setTitle("Stop")
            statstopbutton.setBackgroundColor(UIColor.redColor())
            //code for start button
//            var currentTime = NSDate()
//            timer.setDate(currentTime)
//            timer.start()
            
            
            
            
                   }
        else
        {
            showing=false
            statstopbutton.setTitle("Start")
            statstopbutton.setBackgroundColor(UIColor.greenColor())
            //code for stop button
            timer.stop()
        }
        
        
        
        
        
        
    }
    
    
    
    

}
