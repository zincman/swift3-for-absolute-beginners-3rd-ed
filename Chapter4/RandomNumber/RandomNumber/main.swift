//
//  main.swift
//  RandomNumber
//
//  Created by Derek Lu on 29/04/2017.
//  Copyright © 2017 Derek Lu. All rights reserved.
//

import Foundation

var randomNumber = 1
var userGuess: Int? = 1
var continueGuessing = true
var keepPlaying = true
var input = ""

while keepPlaying {
    continueGuessing = true
    randomNumber = Int(arc4random_uniform(101)) // get a random number between 0-100

    print("The random number to guess is \(randomNumber)")
    while continueGuessing {
        print("Pick a number between 0 and 100.")
        input = NSString(data: FileHandle.standardInput.availableData, encoding: String.Encoding.utf8.rawValue)! as String
        input = input.replacingOccurrences(of: "\n", with: "", options: NSString.CompareOptions.literal, range: nil)
        userGuess = Int(input)
        if userGuess == randomNumber {
            continueGuessing = false
            print("Correct number!")
        }
        else if userGuess! > randomNumber {
            print("Your guessed too high")
        }
        else {
            print("Your guess is too low")
        }
    }
    print ("Play Again? Y or N")
    input = NSString(data: FileHandle.standardInput.availableData, encoding:String.Encoding.utf8.rawValue)! as String
    input  = input.replacingOccurrences(of: "\n", with: "", options: NSString.CompareOptions.literal, range: nil)
    if input == "N" || input == "n" {
        keepPlaying = false
    }
}

