//
//  NotesViewController.swift
//  NursingSystem
//
//  Created by  on 11/7/16.
//  Copyright © 2016 uhcl.edu. All rights reserved.
//

import UIKit
protocol NoteViewDelegate {
    func didUpdateNoteWithTitle(newTitle:String,andBody newBody:String)
    func deleteFirstRow()
}

class NotesViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var txtBody: UITextView!
    var strBodyText:String!
    var delegate:NoteViewDelegate?
    
    @IBOutlet weak var btnDoneEditing: UIBarButtonItem!
    func textViewDidBeganEditing(textView:UITextView)
    {
        self.btnDoneEditing.tintColor=UIColor(red: 0,green: 122.0/255.0,blue:1,alpha:1)
    }
    
    

    @IBAction func doneEditingBody(sender: AnyObject) {
        self.txtBody.resignFirstResponder()
        self.btnDoneEditing.tintColor=UIColor
        .clearColor()
        if self.delegate != nil
        {
            if (txtBody.text != "")
            {
            self.delegate!.didUpdateNoteWithTitle(self.navigationItem.title!, andBody: self.txtBody.text)
            }
            else
            {
                self.btnDoneEditing.tintColor=UIColor(red: 0,green: 122.0/255.0,blue:1,alpha:1)
                let alert=UIAlertController(title:"Error",message: "Note is empty",preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title:"Close",style: .Default,handler: {_ in}))
                self.presentViewController(alert, animated: true, completion: {})
            }
        }
        
    }
    func textViewDidChange(textView: UITextView) {
        let component=self.txtBody.text.componentsSeparatedByString("\n")
        self.navigationItem.title=""
        for item in component
        {
            if item.characters.count>0
            {
                self.navigationItem.title=item
                break
            }
        }
    }
    
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if self.delegate != nil
        {
            if(txtBody.text != "")
            {
            self.delegate!.didUpdateNoteWithTitle(self.navigationItem.title!, andBody: self.txtBody.text)
            }
            else
            {
                self.delegate!.deleteFirstRow()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtBody.delegate=self
        self.txtBody.becomeFirstResponder()
        self.txtBody.text=self.strBodyText
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
