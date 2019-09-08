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
    case Spades, Diamonds, Clubs, Hearts
    

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
}
