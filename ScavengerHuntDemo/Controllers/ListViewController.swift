//
//  ListViewController.swift
//  ScavengerHuntDemo
//
//  Created by Scott Krulcik on 9/23/14.
//  Copyright (c) 2014 Scott Krulcik. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    var itemsList = [ScavengerHuntItem]()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("GoalCell") as UITableViewCell
        let item = itemsList[indexPath.row]
        cell.textLabel!.text = item.name
        
        if item.isComplete {
            cell.accessoryType = .Checkmark
            cell.imageView!.image = item.photo
        }else{
            cell.accessoryType = .None
            cell.imageView?.image = nil
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            imagePicker.sourceType = .Camera
        } else {
            imagePicker.sourceType = .PhotoLibrary
        }
        
        imagePicker.delegate = self
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let indexPath = tableView.indexPathForSelectedRow()
        let selectedItem = itemsList[indexPath!.row]
        
        let photo = info[UIImagePickerControllerOriginalImage] as UIImage
        selectedItem.photo = photo
        
        dismissViewControllerAnimated(true, completion:{
            self.tableView.deselectRowAtIndexPath(indexPath!, animated: true)
            self.tableView.reloadData()
            //self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        })
        
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue)
    {
        let addController = segue.sourceViewController as ViewController
        if let newItem = addController.createdItem{
            itemsList += [newItem]
            let indexPath = NSIndexPath(forRow: itemsList.count-1, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
}