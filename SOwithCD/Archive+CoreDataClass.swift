//
//  Archive+CoreDataClass.swift
//  SOwithCD
//
//  Created by Станислав Тищенко on 08.06.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(Archive)
public class Archive: NSManagedObject {
    class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    class func saveObject(link: URL, ownerLink: URL, ownerName: String,
                          tags: [String], title: String) -> Bool {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Archive", in: context)
        let manageObject = NSManagedObject(entity: entity!, insertInto: context)
        manageObject.setValue(link, forKey: "link")
        manageObject.setValue(ownerLink, forKey: "ownerLink")
        manageObject.setValue(ownerName, forKey: "ownerName")
        manageObject.setValue(tags, forKey: "tags")
        manageObject.setValue(title, forKey: "title")
        do {
            try context.save()
            //print("save")
            return true
        } catch {
            //print("not save")
            return false
        }
    }
    class func fetchObject() -> [Archive]? {
        let context = getContext()
        var archive: [Archive]? = nil
        do {
            archive = try context.fetch(Archive.fetchRequest())
            return archive
        } catch {
            return archive
        }
    }
}
