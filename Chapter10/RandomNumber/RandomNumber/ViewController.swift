//
//  ViewController.swift
//  RandomNumber
//
//  Created by Derek Lu on 02/05/2017.
//  Copyright © 2017 Derek Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var randomNumberLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func seedAction(_ sender: UIButton) {
        srandom(CUnsignedInt(time(nil)))
        randomNumberLabel.text = "Generator seeded"
    }

    @IBAction func generateAction(_ sender: UIButton) {
        let generated = (arc4random() % 100) + 1
        randomNumberLabel.text = "\(generated)"
    }
}

