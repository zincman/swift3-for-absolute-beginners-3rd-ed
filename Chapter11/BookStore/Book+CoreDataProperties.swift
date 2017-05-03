//
//  Book+CoreDataProperties.swift
//  BookStore
//
//  Created by Derek Lu on 03/05/2017.
//  Copyright © 2017 Derek Lu. All rights reserved.
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var title: String?
    @NSManaged public var price: NSDecimalNumber?
    @NSManaged public var yearPublished: Int32
    @NSManaged public var author: Author?

}
