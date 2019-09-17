//
//  Card.swift
//  Cards
//
//  Created by Marcus Bamberger on 9/7/19.
//  Copyright © 2019 Marcus Bamberger. All rights reserved.
//

import Cocoa



//------------------------------------------------------------------------------
// Card
// Handles a single playing card.
//------------------------------------------------------------------------------
class Card: Equatable {
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
    // Card initializer
    //------------------------------------------------------------------------------
    init?(_ cardName: String) {
        let parts = cardName.components(separatedBy: "-")
        
        //Figure out the face
        guard let parsedFace = Face(parts[0]) else {
            return nil
        }
        face = parsedFace
        
        //Figure out the suit
        guard let parsedSuit = Suit(parts[1]) else {
            return nil
        }
        suit = parsedSuit
        
        score = face.score()
    }
    
    
    //------------------------------------------------------------------------------
    // comparison function
    //------------------------------------------------------------------------------
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.face == rhs.face && lhs.suit == rhs.suit
    }
    
    
    //------------------------------------------------------------------------------
    // description
    // Generates a text description of this card (Three of Hearts)
    //------------------------------------------------------------------------------
    func description() -> String {
        return "\(face) of \(suit)"
    }
    
    
    //------------------------------------------------------------------------------
    // shortDescription
    // Generates a short text description of this card (3H)
    //------------------------------------------------------------------------------
    func shortDescription() -> String {
        return "\(face.short())-\(suit.short())"
    }
    
    
    //------------------------------------------------------------------------------
    // testClass
    //------------------------------------------------------------------------------
    class func testClass(tester: Tester) {
        Card.testCard(tester: tester, text: "7-Hearts", properties: (.Seven, .Hearts, 7))
        Card.testCard(tester: tester, text: "one-Spade", properties: nil)
        Card.testCard(tester: tester, text: "Queen-D", properties: (.Queen, .Diamonds, 10))
        Card.testCard(tester: tester, text: "4-heart", properties: (.Four, .Hearts, 4))
        Card.testCard(tester: tester, text: "9-clubs", properties: (.Nine, .Clubs, 9))
        Card.testCard(tester: tester, text: "J-s", properties: (.Jack, .Spades, 10))
        Card.testCard(tester: tester, text: "Queen-Hobbits", properties: nil)
        Card.testCard(tester: tester, text: "44-heart", properties: nil)
        Card.testCard(tester: tester, text: "Hobbit-clubs", properties: nil)
        Card.testCard(tester: tester, text: "J-K", properties: nil)

    }
    
    
    //------------------------------------------------------------------------------
    // testCard
    //------------------------------------------------------------------------------
    class func testCard(tester: Tester, text: String, properties: (Face, Suit, Int)?) {
        let card = Card(text)
        if card == nil {
            tester.test(properties == nil, msg: "Card = \(text)")
            return
        }
        if properties == nil {
            tester.test(false, msg: "Card = \(text)")
            return
        }
        tester.test(card!.face == properties!.0, msg: "Card = \(text)")
        tester.test(card!.suit == properties!.1, msg: "Card = \(text)")
        tester.test(card!.score == properties!.2, msg: "Card = \(text)")
    }
}
