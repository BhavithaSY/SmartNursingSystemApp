//
//  NoteTakingTableViewController.swift
//  NursingSystem
//
//  Created by  on 11/5/16.
//  Copyright © 2016 uhcl.edu. All rights reserved.
//

import UIKit

class NoteTakingTableViewController: UITableViewController,NoteViewDelegate {
    
    
    @IBOutlet weak var Menu: UIBarButtonItem!
    var arrNotes=[[String:String]]()
    var selectedIndex = -1
    
    
    @IBAction func newNote(sender: AnyObject) {
        var newdict=["title":"","body":""]
        arrNotes.insert(newdict, atIndex: 0)
        self.selectedIndex=0
        self.tableView.reloadData()
       saveNoteArray()
         performSegueWithIdentifier("showEditorSegue", sender: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let noteEditorVC=segue.destinationViewController as! NotesViewController
        noteEditorVC.navigationItem.title=arrNotes[self.selectedIndex]["title"]
        noteEditorVC.strBodyText=arrNotes[self.selectedIndex]["body"]
        noteEditorVC.delegate=self
    }
    
    
    func didUpdateNoteWithTitle(newTitle: String, andBody newBody: String) {
        if newTitle != ""
        {
        self.arrNotes[self.selectedIndex]["title"]=newTitle
        self.arrNotes[self.selectedIndex]["body"]=newBody
//        for ar in arrNotes
//        {
//            for (key,value) in ar
//            {
//               if(value != "")
//               {
//                arrNotes.remove
//                }
//            }
//        }
        self.tableView.reloadData()
        saveNoteArray()
        }
    }
    
    
    func saveNoteArray()
    {
        NSUserDefaults.standardUserDefaults().setObject(arrNotes, forKey: "notes")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let newNotes=NSUserDefaults.standardUserDefaults().arrayForKey("notes") as? [[String:String]]
        {
            arrNotes=newNotes
        }
      //  self.tableView.allowsMultipleSelectionDuringEditing = NO;
//        for check in arrNotes
//        {
//            
//            
//            for(kay , value) in check
//            {
//                if value == ""
//                {
//                    arrNotes.removeValueForKey(kay)
//                }
//            }
        
//            let indextoremove = check.keys.array.filter { check[$0]! == "" }
//            for key in indextoremove
//            {
//                check.removeValueForKey(key)
//            }
           
        //}
       
        
        if self.revealViewController() != nil
        {
            Menu.target=self.revealViewController()
            Menu.action="revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.reloadData()
    }

    
   
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == .Delete)
        {
         print("you pressed delete")
            arrNotes.removeAtIndex(indexPath.row)
            saveNoteArray()
            tableView.reloadData()
            
        }
    }
    func deleteFirstRow()
    {
        arrNotes.removeAtIndex(0)
        self.tableView.reloadData()
        saveNoteArray()
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrNotes.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       var cell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath)
        cell.textLabel?.text=arrNotes[indexPath.row]["title"]

        // Configure the cell...

        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
         self.selectedIndex=indexPath.row
        performSegueWithIdentifier("showEditorSegue", sender: nil)
       
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
