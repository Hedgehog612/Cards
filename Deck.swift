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
class Deck {
    var cards = [Card]()        // All the cards we contain
    
    
    //------------------------------------------------------------------------------
    // Initializer
    //------------------------------------------------------------------------------
    init() {
    }
    
    
    //------------------------------------------------------------------------------
    // build
    // Creates a 52-card deck in a predetermined order.
    //------------------------------------------------------------------------------
    func build() {
        for suit in Suits {
            for face in faces {
                cards.append(Card(face: face, suit: suit, score: faceScore[face]!))
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
    // Moves a card from one deck to another
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
        for card in cards {
            card.show()
        }
    }
}
