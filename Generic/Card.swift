//
//  Card.swift
//  Cards
//
//  Created by Marcus Bamberger on 9/7/19.
//  Copyright © 2019 Marcus Bamberger. All rights reserved.
//

import Cocoa



//------------------------------------------------------------------------------
// Card
// Handles a single playing card.
//------------------------------------------------------------------------------
class Card {
    var face: Face      // The face of the card (ace, 3, queen, etc.)
    var suit: Suit      // The suit of the card
    var score: Int      // The score for the 31 points game
    var order = 0.0     // Randomly assigned, used for shuffling the deck.
    
    
    //------------------------------------------------------------------------------
    // Initializer
    //------------------------------------------------------------------------------
    init(face faceIn: Face, suit suitIn: Suit, score scoreIn: Int) {
        face = faceIn
        suit = suitIn
        score = scoreIn
    }

    
    //------------------------------------------------------------------------------
    // description
    // Generates a text description of this card (Three of Hearts)
    //------------------------------------------------------------------------------
    func description() -> String {
        return "\(face) of \(suit)"
    }
    
    
    //------------------------------------------------------------------------------
    // shortDescription
    // Generates a short text description of this card (3H)
    //------------------------------------------------------------------------------
    func shortDescription() -> String {
        return "\(face.short())\(suit.short())"
    }
}
