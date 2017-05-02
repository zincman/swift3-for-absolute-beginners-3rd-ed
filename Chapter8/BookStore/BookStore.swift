//
//  BookStore.swift
//  BookStore
//
//  Created by Derek Lu on 01/05/2017.
//  Copyright © 2017 Derek Lu. All rights reserved.
//

import Foundation

class BookStore {
    var theBookStore: [Book] = []
    
    init(){
        var newBook = Book()
        newBook.title = "Swift for Absolute Beginners"
        newBook.author = "Bennett and Lees"
        newBook.description = "iOS Programming made easy."
        theBookStore.append(newBook)
        
        newBook = Book()
        newBook.title = "A Farewell to Arms"
        newBook.author = "Ernest Hemingway"
        newBook.description = "The story of an affair between an English nurse and an American soldier on the Italian front during War I."
        
        theBookStore.append(newBook)
    }
}
