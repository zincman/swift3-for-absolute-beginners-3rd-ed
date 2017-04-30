//
//  Customer.swift
//  BookStore
//
//  Created by Derek Lu on 29/04/2017.
//  Copyright © 2017 Derek Lu. All rights reserved.
//

import UIKit

class Customer: NSObject {
    var firstName = ""
    var lastName = ""
    var addressLine1 = ""
    var addressLine2 = ""
    var city = ""
    var state = ""
    var zip = ""
    var phoneNumber = ""
    var emailAddress = ""
    var favoriteGenre = ""
    
    func listPurchaseHistory() -> [String]{
        return ["Purchase 1", "Purchase 2"]
    }
}
