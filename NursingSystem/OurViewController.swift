//
//  OurViewController.swift
//  NursingSystem
//
//  Created by  on 11/5/16.
//  Copyright © 2016 uhcl.edu. All rights reserved.
//

import UIKit

class OurViewController: UIViewController {

    @IBOutlet weak var Menu: UIBarButtonItem!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil
        {
            Menu.target=self.revealViewController()
            Menu.action="revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

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
