//
//  Author+CoreDataProperties.swift
//  BookStore
//
//  Created by Derek Lu on 03/05/2017.
//  Copyright © 2017 Derek Lu. All rights reserved.
//

import Foundation
import CoreData


extension Author {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Author> {
        return NSFetchRequest<Author>(entityName: "Author")
    }

    @NSManaged public var lastName: String?
    @NSManaged public var firstName: String?
    @NSManaged public var books: Book?

}
