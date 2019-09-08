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
    case Clubs, Diamonds, Hearts, Spades
    

    //------------------------------------------------------------------------------
    // Initializer from string.
    // Parses a string and returns the corresponding Suit
    //------------------------------------------------------------------------------
    init?(_ suitName: String) {
        if suitName.hasPrefix("C") || suitName.hasPrefix("c") {
            self = .Clubs
        } else if suitName.hasPrefix("D") || suitName.hasPrefix("d") {
            self = .Diamonds
        } else if suitName.hasPrefix("H") || suitName.hasPrefix("h") {
            self = .Hearts
        } else if suitName.hasPrefix("S") || suitName.hasPrefix("s") {
            self = .Spades
        } else {
            return nil
        }
    }
    
    
    //------------------------------------------------------------------------------
    // short
    // Returns a short text description of this suit.
    //------------------------------------------------------------------------------
    func short() -> String {
        switch self {
        case .Clubs: return "C"
        case .Diamonds: return "D"
        case .Hearts: return "H"
        case .Spades: return "S"
        }
    }
}
