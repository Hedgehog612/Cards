//
//  Card.swift
//  Cards
//
//  Created by Marcus Bamberger on 9/7/19.
//  Copyright © 2019 Marcus Bamberger. All rights reserved.
//

import Cocoa


//------------------------------------------------------------------------------
// Suit
// Defines the standard four suits in a deck of cards.
//------------------------------------------------------------------------------
enum Suit {
    case Spade, Diamond, Club, Heart
}

// Defines all the available suits
let Suits: [Suit] = [.Club, .Diamond, .Heart, .Spade]



//------------------------------------------------------------------------------
// Value
// Defines the standard values for a deck of cards (Ace, 2 - 10, and the 
// face cards).
//------------------------------------------------------------------------------
enum Value {
    case Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
}

// Defines all the available values
let Values: [Value] = [.Ace, .Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine, .Ten, .Jack, .Queen, .King]

// Specifies the point value of each value.
let valuePoints: [Value: Int] = [
    .Ace: 11,
    .Two: 2,
    .Three: 3,
    .Four: 4,
    .Five: 5,
    .Six: 6,
    .Seven: 7,
    .Eight: 8,
    .Nine: 9,
    .Ten: 10,
    .Jack: 10,
    .Queen: 10,
    .King: 10
]



//------------------------------------------------------------------------------
// Card
// Handles a single playing card.
//------------------------------------------------------------------------------
class Card {
    var value: Value    // The value of the card (ace, 3, queen, etc.)
    var suit: Suit      // The suit of the card
    var point: Int      // The point value for the 31 points game
    var order = 0.0     // Randomly assigned, used for shuffling the deck.
    
    
    //------------------------------------------------------------------------------
    // Initializer
    //------------------------------------------------------------------------------
    init(value valueIn: Value, suit suitIn: Suit, point pointIn: Int) {
        value = valueIn
        point = pointIn
        suit = suitIn
    }
    
    
    //------------------------------------------------------------------------------
    // show
    // Renders a description of the card to the console.
    //------------------------------------------------------------------------------
    func show() {
        print("This card is the \(value) of \(suit).")
    }
}
