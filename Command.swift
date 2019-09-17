//
//  commandLine.swift
//  Cards
//
//  Created by Marcus Bamberger on 9/8/19.
//  Copyright © 2019 Marcus Bamberger. All rights reserved.
//

import Foundation


typealias CommandInfo = (String, ArgType, (Game) -> (Any...) -> Void)


enum ArgType {
    case None
    case Suit
}


class Command {
    
    
    //------------------------------------------------------------------------------
    // takeTurn
    // This is where the player takes their turn.
    // This allows the player to chose between several actions on their turn.
    //------------------------------------------------------------------------------
    func takeTurn() {
        while true {
            print("\n\nWhat now, boss? Choices are draw, toss, knock, and 31.")
            let choice = readLine()
            print("You chose \(choice!)")
            if choice == "help" {
                game.help()
            } else if choice == "draw" {
                game.drawHuman()
                return
            } else if choice == "toss" {
                game.tossHuman()
                return
            } else if choice == "knock" {
                game.knock()
                return
            } else if choice == "31" {
                game.thirtyOne()
                return
            }
        }
    }
    
 
    //------------------------------------------------------------------------------
    // getCommand
    //------------------------------------------------------------------------------
    func getCommand(game: Game) {
        print("\n\n\nWhat now, boss? Choices are draw, toss, knock, and 31.")
        guard let input = readLine() else {
            assert(false)
            return
        }
        let parts = input.components(separatedBy: " ")
        for (commandName, argType, function) in game.commands {
            if parts[0] == commandName {
                switch argType {
                    case .None:
                        if parts.count != 1 {
                            print("\(commandName) doesn't take any arguments.")
                        }
                    function(game)()
                    
                    case .Suit:
                        if parts.count != 2 {
                            print("\(commandName) requires a Suit argument.")
                        }
                        if let suit = Suit(parts[1]) {
                            function(game)(suit)
                        } else {
                            print("\(commandName) requires a Suit argument.")
                    }
                }
                return
            }
        }
        print("Command not recognized.")
    }
    
}
