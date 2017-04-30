//
//  ViewController.swift
//  Chapter6
//
//  Created by Derek Lu on 30/04/2017.
//  Copyright © 2017 Derek Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func showName(sender: AnyObject) {
        nameLabel.text = "My Name is Brad!"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

