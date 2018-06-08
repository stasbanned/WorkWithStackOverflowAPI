//
//  Archive+CoreDataProperties.swift
//  SOwithCD
//
//  Created by Станислав Тищенко on 08.06.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//
//

import Foundation
import CoreData


extension Archive {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Archive> {
        return NSFetchRequest<Archive>(entityName: "Archive")
    }

    @NSManaged public var title: String?
    @NSManaged public var ownerName: String?
    @NSManaged public var ownerLink: URL?
    @NSManaged public var tags: [String]?
    @NSManaged public var link: URL?

}
