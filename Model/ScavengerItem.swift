//
//  ScavengerItem.swift
//  ScavengerHuntDemo
//
//  Created by Scott Krulcik on 9/23/14.
//  Copyright (c) 2014 Scott Krulcik. All rights reserved.
//

import UIKit

class ScavengerHuntItem: NSObject
{
    let name:String
    var photo:UIImage?
    var isComplete:Bool {
        get {
            return photo != nil
        }
    }
    
    init(itemName:String){
        name = itemName
    }
    
}
