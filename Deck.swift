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
// Contains the order of cards in a given location
//------------------------------------------------------------------------------
class Deck {
    //This creates the deck that is used for everything else.
    var cards = [Card]()
    
    //------------------------------------------------------------------------------
    // Initializer
    //------------------------------------------------------------------------------
    init(card cardIn: Card) {
        cards = [cardIn]
    }
    
    //------------------------------------------------------------------------------
    // build
    // Creates a 52-card deck in a predetermined order
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
    // Randomizes the order of a deck
    //------------------------------------------------------------------------------
    func shuffle() {
        
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
    // Prints a list of cards in the deck
    //------------------------------------------------------------------------------
    func show() {
        for card in cards {
            card.show()
        }
    }
    
    
}
