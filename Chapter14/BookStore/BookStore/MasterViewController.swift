//
//  MasterViewController.swift
//  BookStore
//
//  Created by Derek Lu on 01/05/2017.
//  Copyright © 2017 Derek Lu. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, BookStoreDelegate {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    var myBookStore: BookStore = BookStore()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem

        // Add a navigation item dynamically
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(_ sender: Any) {
//        objects.insert(NSDate(), at: 0)
//        let indexPath = IndexPath(row: 0, section: 0)
//        tableView.insertRows(at: [indexPath], with: .automatic)
        self.performSegue(withIdentifier: "addBookSegue", sender: nil)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedBook: Book = myBookStore.theBookStore[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = selectedBook
                controller.delegate = self
            }
        }
        else if segue.identifier == "addBookSegue" {
            let vc = segue.destination as! AddBookViewController
            vc.delegate = self
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myBookStore.theBookStore.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel!.text = myBookStore.theBookStore[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            objects.remove(at: indexPath.row)
            myBookStore.theBookStore.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    // MARK: - Delegate Methods conforming to the protocol BookStoreDelegate as defined in the AddBookViewController
    func newBook(_ controller: Any, newBook: Book) {
        myBookStore.theBookStore.append(newBook)
        tableView.reloadData()
        _ = navigationController?.popViewController(animated: true)
    }
    
    func deleteBook(_ controller: Any){
        let indexPath = tableView.indexPathForSelectedRow
        let row = (indexPath as NSIndexPath?)?.row
        myBookStore.theBookStore.remove(at: row!)
        tableView.reloadData()
        _ = navigationController?.popViewController(animated: false)
    }
    
    func editBook(_ controller: Any, editBook: Book){
        let indexPath = tableView.indexPathForSelectedRow
        let row = (indexPath as NSIndexPath?)?.row
        myBookStore.theBookStore.insert(editBook, at: row!)
        myBookStore.theBookStore.remove(at: row!+1)
        tableView.reloadData()
        _ = navigationController?.popViewController(animated: true)
    }


}

