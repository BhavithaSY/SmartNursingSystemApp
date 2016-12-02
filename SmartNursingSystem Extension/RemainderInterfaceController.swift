//
//  RemainderInterfaceController.swift
//  NursingSystem
//
//  Created by  on 12/1/16.
//  Copyright © 2016 uhcl.edu. All rights reserved.
//

import WatchKit
import Foundation


class RemainderInterfaceController: WKInterfaceController {
    
    @IBOutlet var tabelOte: WKInterfaceTable!
    var arrayOfTabelRows=["Bhavitha","sai","chinnu"]

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
      loadTabelData()
        
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

    func loadTabelData()
    {
        tabelOte.setNumberOfRows(arrayOfTabelRows.count, withRowType: "rowName")
        var i=0
        for item in arrayOfTabelRows
        {
            let row = tabelOte.rowControllerAtIndex(i) as! RemaindersRow
            row.rowlabel.setText(item)
            i++
        }
        
    }
    
    
    
}
