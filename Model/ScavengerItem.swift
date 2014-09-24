//
//  ScavengerItem.swift
//  ScavengerHuntDemo
//
//  Created by Scott Krulcik on 9/23/14.
//  Copyright (c) 2014 Scott Krulcik. All rights reserved.
//

import UIKit

class ScavengerHuntItem: NSObject, NSCoding
{
    private struct SerializationKeys {
        static let name = "name"
        static let photo = "photo"
    }
    
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
    
    func encodeWithCoder(coder: NSCoder){
        coder.encodeObject(name, forKey:SerializationKeys.name)
        if let thePhoto = photo {
            coder.encodeObject(thePhoto, forKey:SerializationKeys.photo)
        }
    }
    
    required init(coder aDecoder:NSCoder){
        name = aDecoder.decodeObjectForKey(SerializationKeys.name) as String
        photo = aDecoder.decodeObjectForKey(SerializationKeys.photo) as? UIImage
    }
    
}
