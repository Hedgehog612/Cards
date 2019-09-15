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
        if faceName.lowercased().hasPrefix("k") {
            self = .King
        } else if faceName.lowercased().hasPrefix("q") {
            self = .Queen
        } else if faceName.lowercased().hasPrefix("j") {
            self = .Jack
        } else if faceName.hasPrefix("10") || faceName.lowercased().hasPrefix("ten") {
            self = .Ten
        } else if faceName.hasPrefix("9") || faceName.lowercased().hasPrefix("nine") {
            self = .Nine
        } else if faceName.hasPrefix("8") || faceName.lowercased().hasPrefix("eight") {
            self = .Eight
        } else if faceName.hasPrefix("7") || faceName.lowercased().hasPrefix("seven") {
            self = .Seven
        } else if faceName.hasPrefix("6") || faceName.lowercased().hasPrefix("six") {
            self = .Six
        } else if faceName.hasPrefix("5") || faceName.lowercased().hasPrefix("five") {
            self = .Five
        } else if faceName.hasPrefix("4") || faceName.lowercased().hasPrefix("four") {
            self = .Four
        } else if faceName.hasPrefix("3") || faceName.lowercased().hasPrefix("three") {
            self = .Three
        } else if faceName.hasPrefix("2") || faceName.lowercased().hasPrefix("two") {
            self = .Two
        } else if faceName.lowercased().hasPrefix("a") || faceName.hasPrefix("1") {
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
