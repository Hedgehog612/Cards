//
//  main.swift
//  Cards
//
//  Created by Marcus Bamberger on 9/2/19.
//  Copyright © 2019 Marcus Bamberger. All rights reserved.
//

import Foundation
import Cocoa


enum Suit {
    case Spade, Diamond, Club, Heart
}
let Suits: [Suit] = [.Club, .Diamond, .Heart, .Spade]

enum Value {
    case Ace, One, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
}
let Values: [Value] = [.Ace, .Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine, .Ten, .Jack, .Queen, .King]
let valuePoints: [Value: Int] = [
    .Ace: 11,
    .Two: 2,
    .Three: 3,
    .Four: 4,
    .Five: 5,
    .Six: 6,
    .Seven: 7,
    .Eight: 8,
    .Nine: 9,
    .Ten: 10,
    .Jack: 10,
    .Queen: 10,
    .King: 10
]


class Card {
    var value: Value
    var suit: Suit
    var point: Int
    var order = 0.0
    
    init(value valueIn: Value, suit suitIn: Suit, point pointIn: Int) {
        value = valueIn
        point = pointIn
        suit = suitIn
    }
    
    func show() {
        print("This card is the \(value) of \(suit).")
    }
}


class Deck {
    //This creates the deck that is used for everything else.
    var royalty = ["Jack", "Queen", "King"]
    var cards = [Card]()
    
    
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

let dealer = Deck()
let player = Deck()
let opponent = Deck()
let discard = Deck()

func play() {
    let dealer = Deck()
    dealer.build()
    dealer.shuffle()
    
    let player = Deck()
    dealer.dealCard(recipient: player, count: 3)
    
    let opponent = Deck()
    dealer.dealCard(recipient: opponent, count: 3)
    
    let discard = Deck()
    dealer.dealCard(recipient: discard, count: 1)
    
    print("playerDeck")
    player.show()
    print("opponentDeck")
    opponent.show()
    print("discardDeck")
    discard.show()
    
    while true {
        let doesAIMove = takeTurn()
        
        if doesAIMove {
            moveAI()
        }
    }
}


func takeTurn() -> Bool {
    print("\n\nWhat now, boss?")
    let choice = readLine()
    print("You chose \(choice!)")
    if choice == "help" {
        help()
        return false
    } else if choice == "draw" {
        draw()
        return true
    } else if choice == "toss" {
        toss()
        return true
    } else if choice == "knock" {
        knock()
        return false
    }
    return false
}

func moveAI() {
    
}

func help() {
    print("You can draw a card from the deck or from the top of the discard.")
    print("Once you have drawn a card, you must discard a card.")
    print("Your objective is to have cards worth a total of 31 points in hand.")
    print("Face cards are worth 10 and aces are 11.")
    print("To draw from the discard, type toss. To draw from the deck, type draw.")
    print("If you have 31 points, type win. If you think you have more points than your opponent, type knock.")
}

func draw() -> Bool {
    dealer.dealCard(recipient: player, count: 1)
    print("\n\nYou add the card to your hand from the deck. Please choose a card to discard.")
    print("From 0 to 3, your cards are...")
    player.show()
    print("Which card will you discard?")
    let choice = readLine()
    print("You chose\(choice!)")
//    discard.append(player(at: choice))
//    player.remove(at: choice)
    return true
    }

func toss() {
    discard.dealCard(recipient: player, count: 1)
}

func knock() {
    
}

play()

