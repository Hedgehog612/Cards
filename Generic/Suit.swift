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
enum Suit: CaseIterable {
    case Spade, Diamond, Club, Heart
    

    //------------------------------------------------------------------------------
    // Initializer from string.
    // Parses a string and returns the corresponding Suit
    //------------------------------------------------------------------------------
    init?(_ suitName: String) {
        if suitName.hasPrefix("C") || suitName.hasPrefix("c") {
            self = .Club
        } else if suitName.hasPrefix("D") || suitName.hasPrefix("d") {
            self = .Diamond
        } else if suitName.hasPrefix("H") || suitName.hasPrefix("h") {
            self = .Heart
        } else if suitName.hasPrefix("S") || suitName.hasPrefix("s") {
            self = .Spade
        } else {
            return nil
        }
    }
    
    
    //------------------------------------------------------------------------------
    // string
    // Returns a human-readable name for this suit
    //------------------------------------------------------------------------------
    func string() -> String {
        switch self {
        case .Club:
            return "Clubs"
        case .Diamond:
            return "Diamonds"
        case .Heart:
            return "Hearts"
        case .Spade:
            return "Spades"
        }
    }
}
