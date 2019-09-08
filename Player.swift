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
}
