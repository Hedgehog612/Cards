//
//  Suit.swift
//  Cards
//
//  Created by Matt Bamberger on 9/8/19.
//  Copyright © 2019 Marcus Bamberger. All rights reserved.
//

import Foundation


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
    //TODO: Have this ask for another input instead of defaulting to club.
}

