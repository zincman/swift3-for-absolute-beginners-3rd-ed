//
//  ViewController.swift
//  RandomNumberDelegate
//
//  Created by Derek Lu on 03/05/2017.
//  Copyright © 2017 Derek Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GuessDelegate {
    
    var previousGuess = ""
    var randomNumber = 0

    @IBOutlet weak var userGuessLabelOutlet: UILabel!
    @IBOutlet weak var outComeLabelOutlet: UILabel!
    @IBOutlet weak var guessButtonOutlet: UIButton!
    @IBOutlet weak var playAgainButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createRandomNumber()
        playAgainButtonOutlet.isHidden = true
        outComeLabelOutlet.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func  prepare(for segue: UIStoryboardSegue, sender: Any!){
        if segue.identifier == "MyGuessSegue" {
            let vc = segue.destination as! GuessInputViewController
            vc.previousGuess = previousGuess
            vc.delegate = self
        }
    }

    // event triggered by playAgain Button
    @IBAction func playAgainAction(_ sender: Any) {
        createRandomNumber()
        playAgainButtonOutlet.isHidden = true      // only show the button when the user guessed the right #
        guessButtonOutlet.isHidden = false      // show the button
        outComeLabelOutlet.text = ""
        userGuessLabelOutlet.text = "New Game"
        previousGuess = ""
    }
    
    // function called from the GuessInputViewController when the user taps on the Save
    func userDidFinish(_ controller: GuessInputViewController, guess: String) {
        userGuessLabelOutlet.text = "The guess was " + guess
        previousGuess = guess
        let numberGuess = Int(guess)
        if numberGuess! > randomNumber {
            outComeLabelOutlet.text = "Guess too high"
        }
        else if numberGuess! < randomNumber {
            outComeLabelOutlet.text = "Guess too low"
        }
        else {
            outComeLabelOutlet.text = "Guess is correct"
            playAgainButtonOutlet.isHidden = false
            guessButtonOutlet.isHidden = true
        }
        
        // pops the GuessInputViewController off the stack
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }

    // create the random number
    func createRandomNumber(){
        randomNumber = Int(arc4random_uniform(100))     // get random number between 0-100
        print("The random number is: \(randomNumber)")     // lets us cheat
        return
    }
}

