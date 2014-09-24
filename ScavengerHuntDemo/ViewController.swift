//
//  ViewController.swift
//  ScavengerHuntDemo
//
//  Created by Scott Krulcik on 9/23/14.
//  Copyright (c) 2014 Scott Krulcik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var field: UITextField!
    var createdItem: ScavengerHuntItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem"{
            if let name = field.text {
                if !name.isEmpty{
                    createdItem = ScavengerHuntItem(itemName: name)
                }
            }
        }
    }

}

