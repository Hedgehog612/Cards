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
let suits: [Suit] = [.Club, .Diamond, .Heart, .Spade]

// Renders the suits as strings for reference
let suitString: [Suit: String] = [
    .Club: "Club",
    .Diamond: "Diamond",
    .Heart: "Heart",
    .Spade: "Spade",
]

// Parses a string and returns the suit it corresponds to
func suitFromString(_ suitName: String) -> Suit {
    if suitName.hasPrefix("C") || suitName.hasPrefix("c") {
        return .Club
    } else if suitName.hasPrefix("D") || suitName.hasPrefix("d") {
        return .Diamond
    } else if suitName.hasPrefix("H") || suitName.hasPrefix("h") {
        return .Heart
    } else if suitName.hasPrefix("S") || suitName.hasPrefix("s") {
        return .Spade
    }
    
    print("ERROR! Bad suit name \(suitName).")
    return .Club
}

//------------------------------------------------------------------------------
// Face
// Defines the standard faces for a deck of cards (Ace, 2 - 10, and the
// face cards).
//------------------------------------------------------------------------------
enum Face {
    case Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
}

// Defines all the available faces
let faces: [Face] = [.Ace, .Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine, .Ten, .Jack, .Queen, .King]

// Specifies the score of each face.
let faceScore: [Face: Int] = [
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
    // show
    // Renders a description of the card to the console.
    //------------------------------------------------------------------------------
    func show() {
        print("This card is the \(face) of \(face).")
    }
}
