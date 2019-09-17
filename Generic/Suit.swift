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
        if "clubs".hasPrefix(suitName.lowercased()) {
            self = .Clubs
        } else if "diamonds".hasPrefix(suitName.lowercased()) {
            self = .Diamonds
        } else if "hearts".hasPrefix(suitName.lowercased()) {
            self = .Hearts
        } else if "spades".hasPrefix(suitName.lowercased()) {
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
    
    
    //------------------------------------------------------------------------------
    // testClass
    // Performs a comprehensive autotest of this class
    //------------------------------------------------------------------------------
    static func testClass(tester: Tester) {
        // Make sure we can parse all the suits correctly
        for suit in Suit.allCases {
            tester.test(Suit(suit.short()) == suit, msg: "Testing \(suit)")
            tester.test(Suit(suit.short().lowercased()) == suit, msg: "Testing \(suit)")
            tester.test(Suit(suit.short().uppercased()) == suit, msg: "Testing \(suit)")

            tester.test(Suit(String(describing: suit)) == suit, msg: "Testing \(suit)")
            tester.test(Suit(String(describing: suit).lowercased()) == suit, msg: "Testing \(suit)")
            tester.test(Suit(String(describing: suit).uppercased()) == suit, msg: "Testing \(suit)")
        }
    }
}
