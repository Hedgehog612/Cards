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
    // Initializer from string.
    // Parses a string and returns the corresponding Face
    //------------------------------------------------------------------------------
    init?(_ faceName: String) {
        if "king".hasPrefix(faceName.lowercased()) {
            self = .King
        } else if "queen".hasPrefix(faceName.lowercased()) {
            self = .Queen
        } else if "jack".hasPrefix(faceName.lowercased()) {
            self = .Jack
        } else if faceName == "10" || "ten".hasPrefix(faceName.lowercased()) {
            self = .Ten
        } else if faceName == "9" || "nine".hasPrefix(faceName.lowercased()) {
            self = .Nine
        } else if faceName == "8" || "eight".hasPrefix(faceName.lowercased()) {
            self = .Eight
        } else if faceName == "7" || "seven".hasPrefix(faceName.lowercased()) {
            self = .Seven
        } else if faceName == "6" || "six".hasPrefix(faceName.lowercased()) {
            self = .Six
        } else if faceName == "5" || "five".hasPrefix(faceName.lowercased()) {
            self = .Five
        } else if faceName == "4" || "four".hasPrefix(faceName.lowercased()) {
            self = .Four
        } else if faceName == "3" || "three".hasPrefix(faceName.lowercased()) {
            self = .Three
        } else if faceName == "2" || "two".hasPrefix(faceName.lowercased()) {
            self = .Two
        } else if "ace".hasPrefix(faceName.lowercased()) || faceName == "1" {
            self = .Ace
        } else {
            return nil
        }
    }
    
    
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
    
    
    //------------------------------------------------------------------------------
    // short
    // Returns a short text description of this face
    //------------------------------------------------------------------------------
    func short() -> String {
        switch self {
        case .Ace: return "A"
        case .Two: return "2"
        case .Three: return "3"
        case .Four: return "4"
        case .Five: return "5"
        case .Six: return "6"
        case .Seven: return "7"
        case .Eight: return "8"
        case .Nine: return "9"
        case .Ten: return "10"
        case .Jack: return "J"
        case .Queen: return "Q"
        case .King: return "K"
        }
    }
    
    
    //------------------------------------------------------------------------------
    // testClass
    // Performs a comprehensive autotest of this class
    //------------------------------------------------------------------------------
    static func testClass(tester: Tester) {
        // Make sure we can parse all the faces correctly
        for face in Face.allCases {
            tester.test(Face(face.short()) == face, msg: "Testing \(face)")
            tester.test(Face(face.short().lowercased()) == face, msg: "Testing \(face)")
            tester.test(Face(face.short().uppercased()) == face, msg: "Testing \(face)")

            tester.test(Face(String(describing: face)) == face, msg: "Testing \(face)")
            tester.test(Face(String(describing: face).lowercased()) == face, msg: "Testing \(face)")
            tester.test(Face(String(describing: face).uppercased()) == face, msg: "Testing \(face)")
        }
    }
}
