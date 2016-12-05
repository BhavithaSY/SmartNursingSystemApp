//
//  ActualReamainderAddingInterfaceController.swift
//  NursingSystem
//
//  Created by  on 12/1/16.
//  Copyright © 2016 uhcl.edu. All rights reserved.
//

import WatchKit
import Foundation


class ActualReamainderAddingInterfaceController: WKInterfaceController {
    
    @IBOutlet var textOutPut: WKInterfaceLabel!
    
    
    

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    @IBAction func givingInput() {
        self.presentTextInputControllerWithSuggestions(["PreOp-care","postop-care","patient Sample","Temperature","Medication","BP","writing Record"], allowedInputMode: WKTextInputMode.AllowEmoji) { (output) in
            self.textOutPut.setText("\(output!)")
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    

}
