//
//  ViewController.swift
//  BookStore
//
//  Created by Derek Lu on 03/05/2017.
//  Copyright © 2017 Derek Lu. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var managedObjectContext: NSManagedObjectContext!

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext as NSManagedObjectContext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadBooks().count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell?
        let book: Book = loadBooks()[indexPath.row]
        cell?.textLabel?.text = book.title
        return cell!
    }

    @IBAction func addNew(_ sender: Any) {
        let book: Book = NSEntityDescription.insertNewObject(forEntityName: "Book", into: managedObjectContext) as! Book
        book.title = "My Book" + String(loadBooks().count)
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            NSLog("My Error: %@", error)
        }
        myTableView.reloadData()
    }
    
    func loadBooks() -> [Book]{
        let fetchRequest: NSFetchRequest<Book> = Book.fetchRequest()
        var result: [Any] = []
        do {
            result = try managedObjectContext.fetch(fetchRequest)
        } catch let error as NSError {
            NSLog("My Error: %@", error)
        }
        
        return result as! [Book]
    }

}

