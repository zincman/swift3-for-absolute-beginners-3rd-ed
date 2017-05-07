//
//  DetailViewController.swift
//  BookStore
//
//  Created by Derek Lu on 01/05/2017.
//  Copyright © 2017 Derek Lu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var pagesOutlet: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!
    
    var delegate: BookStoreDelegate? = nil
    
    var myBook = Book()
    
    var detailItem: Book? {
        didSet {
            // Update the view.
        }
    }

    func configureView() {
        if let detail: Any = self.detailItem {
            myBook = detail as! Book
            titleLabel.text = myBook.title
            authorLabel.text = myBook.author
            descriptionTextView.text = myBook.description
            pagesOutlet.text = String(myBook.pages)
            if myBook.readThisBook {
                switchOutlet.isOn = true
            }
            else {
                switchOutlet.isOn = false
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editDetail" {
            let vc = segue.destination as! AddBookViewController
            vc.delegate = delegate
            vc.editBook = true
            vc.book = myBook
        }
    }

    @IBAction func deleteBookAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Warning", message: "Delete this book?", preferredStyle: .alert)
        let noAction = UIAlertAction(title: "No", style: .cancel){(action) in
            print("Cancel")
        }
        let yesAction = UIAlertAction(title: "Yes", style: .destructive){(action) in
            self.delegate!.deleteBook(self)
        }
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        
        present(alertController, animated: false, completion: nil)
    }

}

