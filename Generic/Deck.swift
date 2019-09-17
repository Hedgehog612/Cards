//
//  Deck.swift
//  Cards
//
//  Created by Marcus Bamberger on 9/7/19.
//  Copyright © 2019 Marcus Bamberger. All rights reserved.
//

import Cocoa


//------------------------------------------------------------------------------
// Deck
// Manages a deck of cards. This isn't necessarily a complete 52 card deck—
// it can be something like a player's hand, or a discard pile.
//------------------------------------------------------------------------------
class Deck: Equatable {
    var cards = [Card]()        // All the cards we contain
    
    
    //------------------------------------------------------------------------------
    // Initializer
    //------------------------------------------------------------------------------
    init() {
    }
    
    
    //------------------------------------------------------------------------------
    // stringInitializer
    //------------------------------------------------------------------------------
    init?(cardNames: [String]) {
        for cardName in cardNames {
            guard let card = Card(cardName) else {
                return nil
            }
            cards.append(card)
        }
    }
    
    
    //------------------------------------------------------------------------------
    // comparison function
    //------------------------------------------------------------------------------
    static func == (lhs: Deck, rhs: Deck) -> Bool {
        return lhs.cards == rhs.cards
    }

    
    //------------------------------------------------------------------------------
    // build
    // Creates a 52-card deck in a predetermined order.
    //------------------------------------------------------------------------------
    func build() {
        for suit in Suit.allCases {
            for face in Face.allCases {
                cards.append(Card(face: face, suit: suit, score: face.score()))
            }
        }
    }
    
    
    //------------------------------------------------------------------------------
    // shuffle
    // Randomizes the order of a deck.
    //------------------------------------------------------------------------------
    func shuffle() {
        // Assign a random value to each card's order property, then sort based on order.
        for card in cards {
            card.order = Double.random(in: 0...1)
        }
        cards.sort { $0.order < $1.order }
    }
    
    
    //------------------------------------------------------------------------------
    // dealCard
    // Moves the first n cards in this deck to another deck.
    //------------------------------------------------------------------------------
    func dealCard(recipient: Deck, count: Int) {
        for _ in 1...count {
            let card = cards.first
            cards.remove(at: 0)
            recipient.cards.append(card!)
        }
    }
    
    
    //------------------------------------------------------------------------------
    // show
    // Prints a list of all the cards in the deck.
    //------------------------------------------------------------------------------
    func show() {
        for (index, card) in cards.enumerated() {
            print("   #\(index + 1): \(card.description()) (\(card.shortDescription()))")
        }
    }
    
    
    //------------------------------------------------------------------------------
    // contains
    // Tests to see if a card is in a given deck
    //------------------------------------------------------------------------------
    func contains(card: Card) -> Bool {
        return cards.firstIndex(of: card) != nil
    }
    
    
    //------------------------------------------------------------------------------
    // testClass
    // tests the function of the deck class
    //------------------------------------------------------------------------------
    class func testClass(tester: Tester) {
        let deckOne = Deck(cardNames: ["2-H", "5-S", "Q-C"])!
        let deckTwo = Deck(cardNames: ["2-H", "5-S", "Q-C"])!
        let deckThree = Deck(cardNames: ["A-D", "7-S", "8-C"])!
        
        tester.test(deckOne.cards.count == 3)
        tester.test(deckOne == deckTwo)
        tester.test(deckOne != deckThree)
        
        deckOne.dealCard(recipient: deckTwo, count: 1)
        tester.test(deckOne == Deck(cardNames: ["5-S", "Q-C"]))
        tester.test(deckTwo == Deck(cardNames: ["2-H", "5-S", "Q-C", "2-H"]))
        
        tester.test(deckOne.contains(card: Card("5-S")!))
        tester.test(!deckTwo.contains(card: Card("3-D")!))
        
    }
    
    //    TODO: Flesh out the deck testing with more test cases and more test functions

}
