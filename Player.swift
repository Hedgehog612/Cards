//
//  Player.swift
//  Cards
//
//  Created by Matt Bamberger on 9/8/19.
//  Copyright © 2019 Marcus Bamberger. All rights reserved.
//

import Foundation



//------------------------------------------------------------------------------
// Player
// A player in the game. Each player has their own deck of cards.
//------------------------------------------------------------------------------
class Player {
    var name: String
    var deck: Deck
    
    
    //------------------------------------------------------------------------------
    // Initializer
    //------------------------------------------------------------------------------
    init(_ nameIn: String) {
        name = nameIn
        deck = Deck()
    }
    
    
    //------------------------------------------------------------------------------
    // show
    // Shows the state of this player on the console
    //------------------------------------------------------------------------------
    func show() {
        print(name)
        deck.show()
    }
    
    
    //------------------------------------------------------------------------------
    // scoreSuit
    // How many points do we have in a specified suit?
    //------------------------------------------------------------------------------
    func scoreSuit(suit: Suit) -> Int {
        var score = 0
        for card in deck.cards {
            if suit == card.suit {
                score = score + card.score
            }
        }

        return score
    }
}

// TODO: Add tests
