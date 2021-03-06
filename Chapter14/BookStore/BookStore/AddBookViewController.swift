//
//  AddBookViewController.swift
//  BookStore
//
//  Created by Derek Lu on 07/05/2017.
//  Copyright © 2017 Derek Lu. All rights reserved.
//

import UIKit

protocol BookStoreDelegate {
    func newBook(_ controller: Any, newBook: Book)
    func editBook(_ controller: Any, editBook: Book)
    func deleteBook(_ controller: Any)
}

class AddBookViewController: UIViewController {
    var book = Book()
    var delegate: BookStoreDelegate?
//    var read = false
    var editBook = false

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var authorText: UITextField!
    @IBOutlet weak var pagesText: UITextField!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if editBook == true {
            self.title = "Edit Book"
            titleText.text = book.title
            authorText.text = book.author
            pagesText.text = String(book.pages)
            descriptionText.text = book.description
            if book.readThisBook {
                switchOutlet.isOn = true
            }
            else {
                switchOutlet.isOn = false
            }
        }
        else {
            self.title = "Add a Book"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveBookAction(_ sender: Any) {
        book.title = titleText.text!
        book.author = authorText.text!
        book.description = descriptionText.text!
        book.pages = Int(pagesText.text!)!
        if switchOutlet.isOn {
            book.readThisBook = true
        }
        else {
            book.readThisBook = false
        }
        
        if editBook {
            delegate!.editBook(self, editBook: book)
        }
        else {
            delegate!.newBook(self, newBook: book)
        }
    }
}
