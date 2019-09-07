//
//  main.swift
//  Cards
//
//  Created by Marcus Bamberger on 9/2/19.
//  Copyright © 2019 Marcus Bamberger. All rights reserved.
//

import Foundation
import Cocoa

func play() {
    let dealer = Deck(card: Card(value: .Ace, suit: .Spade, point: 11))
    dealer.cards.remove(at: 0)
    dealer.build()
    dealer.shuffle()
    
    let player = Deck(card: Card(value: .Ace, suit: .Spade, point: 11))
    player.cards.remove(at: 0)
    dealer.dealCard(recipient: player, count: 3)
    
    let opponent = Deck(card: Card(value: .Ace, suit: .Spade, point: 11))
    opponent.cards.remove(at: 0)
    dealer.dealCard(recipient: opponent, count: 3)
    
    let discard = Deck(card: Card(value: .Ace, suit: .Spade, point: 11))
    discard.cards.remove(at: 0)
    dealer.dealCard(recipient: discard, count: 1)
    
    print("playerDeck")
    player.show()
    print("opponentDeck")
    opponent.show()
    print("discardDeck")
    discard.show()
    
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
        let choice = Int(readLine()!)
        print("You chose\(choice!)")
        let card = player.cards[choice!]
        player.cards.remove(at: choice!)
        discard.cards.append(card)
        player.show()
        return true
    }
    
    func toss() -> Bool {
        discard.dealCard(recipient: player, count: 1)
        print("\n\nYou add the card to your hand from the discard. Please choose a card to discard.")
        print("From 0 to 3, your cards are...")
        player.show()
        print("Which card will you discard?")
        let choice = Int(readLine()!)
        print("You chose\(choice!)")
        let card = player.cards[choice!]
        player.cards.remove(at: choice!)
        discard.cards.append(card)
        player.show()
        return true
    }
    
    func knock() {
        
    }
    
    while true {
        let doesAIMove = takeTurn()
        
        if doesAIMove {
            moveAI()
        }
    }
}

play()

