//
//  ItemsManager.swift
//  ScavengerHuntDemo
//
//  Created by Scott Krulcik on 9/23/14.
//  Copyright (c) 2014 Scott Krulcik. All rights reserved.
//

import Foundation


class ItemsManager:NSObject{
    var items = [ScavengerHuntItem]()
     lazy private var archivePath: String = {
        let fileManager = NSFileManager.defaultManager()
        let documentsDirectoryURLs = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as [NSURL]
        let archiveURL = documentsDirectoryURLs.first!.URLByAppendingPathComponent("ScavengerHuntItems", isDirectory:false)
        return archiveURL.path!
    }()
    
    func save(){
        NSKeyedArchiver.archiveRootObject(items, toFile: archivePath)
    }
    
    private func unarchiveSavedItems(){
        if NSFileManager.defaultManager().fileExistsAtPath(archivePath){
            let savedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath) as [ScavengerHuntItem]
            items += savedItems
        }
    }
    
    override init() {
        super.init()
        unarchiveSavedItems()
    }
}