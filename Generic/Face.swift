//
//  Face.swift
//  Cards
//
//  Created by Matt Bamberger on 9/8/19.
//  Copyright © 2019 Marcus Bamberger. All rights reserved.
//

import Foundation


//------------------------------------------------------------------------------
// Face
// Defines the standard faces for a deck of cards (Ace, 2 - 10, and the
// face cards).
//------------------------------------------------------------------------------
enum Face: CaseIterable {
    case Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King

    
    //------------------------------------------------------------------------------
    // score
    // What's the score value of this face in the 31 card game?
    //------------------------------------------------------------------------------
    func score() -> Int {
        switch self {
        case .Ace: return 11
        case .Two: return 2
        case .Three: return 3
        case .Four: return 4
        case .Five: return 5
        case .Six: return 6
        case .Seven: return 7
        case .Eight: return 8
        case .Nine: return 9
        case .Ten: return 10
        case .Jack: return 10
        case .Queen: return 10
        case .King: return 10
        }
    }
}
