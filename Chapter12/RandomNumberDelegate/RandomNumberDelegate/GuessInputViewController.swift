//
//  GuessInputViewController.swift
//  RandomNumberDelegate
//
//  Created by Derek Lu on 03/05/2017.
//  Copyright © 2017 Derek Lu. All rights reserved.
//

import UIKit

protocol GuessDelegate {
    func userDidFinish(_ controller: GuessInputViewController, guess: String)
}

class GuessInputViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: GuessDelegate? = nil
    var previousGuess = ""

    @IBOutlet weak var guessLabelOutlet: UILabel!
    @IBOutlet weak var guessTextOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if(!previousGuess.isEmpty) {
            guessLabelOutlet.text = "Your previous guess was \(previousGuess)"
        }
        guessTextOutlet.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveGuessAction(_ sender: Any) {
        if delegate != nil {
            delegate!.userDidFinish(self, guess: guessTextOutlet.text!)
        }
    }
}
