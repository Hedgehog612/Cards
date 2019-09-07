//
//  Deck.swift
//  Cards
//
//  Created by Marcus Bamberger on 9/7/19.
//  Copyright © 2019 Marcus Bamberger. All rights reserved.
//

import Cocoa

class Deck {
    //This creates the deck that is used for everything else.
    var cards = [Card]()
    
    init(card cardIn: Card) {
        cards = [cardIn]
    }
    
    func build() {
        for suit in Suits {
            for value in Values {
                cards.append(Card(value: value, suit: suit, point: valuePoints[value]!))
            }
        }
    }
    
    
    func shuffle() {
        //        This function reshuffles and randomizes a deck of cards
        for card in cards {
            card.order = Double.random(in: 0...1)
        }
        cards.sort { $0.order < $1.order }
    }
    
    func dealCard(recipient: Deck, count: Int) {
        for _ in 1...count {
            let card = cards.first
            cards.remove(at: 0)
            recipient.cards.append(card!)
        }
    }
    func show() {
        // This function prints the deck
        for card in cards {
            card.show()
        }
    }
    
    
}
