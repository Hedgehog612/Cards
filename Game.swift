//
//  Game.swift
//  Cards
//
//  Created by Matt Bamberger on 9/8/19.
//  Copyright © 2019 Marcus Bamberger. All rights reserved.
//

import Foundation



//------------------------------------------------------------------------------
// Game
// Game is the master class that owns everything in the game and runs the core
// game logic.
//------------------------------------------------------------------------------
class Game {
    let dealer = Deck()
    let player = Deck()
    let opponent = Deck()
    let discard = Deck()
    var endGame = false     // Is it time to end the game?
    
    
    //------------------------------------------------------------------------------
    // Initializer
    //------------------------------------------------------------------------------
    init() {
        // Build the deck
        dealer.build()
        dealer.shuffle()
        
        // Deal cards to all the players
        dealer.dealCard(recipient: player, count: 3)
        dealer.dealCard(recipient: opponent, count: 3)
        
        // And deal one card to the discard pile
        dealer.dealCard(recipient: discard, count: 1)
    }

    
    //------------------------------------------------------------------------------
    // Play
    // This is the main game loop. We repeatedly display the game state, let the
    // players move, and check if the game is over.
    //------------------------------------------------------------------------------
    func play() {
        while !endGame {
            showGameState()
            takeTurn()
            
            if !endGame {
                moveAI()
            }
        }
        
        // TODO: end the game
    }
    
    
    //------------------------------------------------------------------------------
    // showGameState
    // Show the game state on the console prior to the player's turn
    //------------------------------------------------------------------------------
    func showGameState() {
        print("playerDeck")
        player.show()
        print("opponentDeck")
        opponent.show()
        print("discardDeck")
        discard.show()
    }


    //------------------------------------------------------------------------------
    // takeTurn
    // This is where the player takes their turn.
    // This allows the player to chose between several actions on their turn.
    //------------------------------------------------------------------------------
    func takeTurn() {
        while true {
            print("\n\nWhat now, boss?")
            let choice = readLine()
            print("You chose \(choice!)")
            if choice == "help" {
                help()
            } else if choice == "draw" {
                draw()
                return
            } else if choice == "toss" {
                toss()
                return
            } else if choice == "knock" {
                knock()
                return
            }
        }
    }
    
    
    //------------------------------------------------------------------------------
    // moveAI
    // moveAI is how the AI determines what to play and executes its turn.
    //------------------------------------------------------------------------------
    func moveAI() {
        
    }
    
    
    //------------------------------------------------------------------------------
    // Help
    // Help contains useful information about the available actions to take on your turn.
    //------------------------------------------------------------------------------
    func help() {
        print("You can draw a card from the deck or from the top of the discard.")
        print("Once you have drawn a card, you must discard a card.")
        print("Your objective is to have cards worth a total of 31 points in hand.")
        print("Face cards are worth 10 and aces are 11.")
        print("To draw from the discard, type toss. To draw from the deck, type draw.")
        print("If you have 31 points, type win. If you think you have more points than your opponent in a specific suit, type knock.")
        print("Be careful - if you're wrong, you lose the game.")
    }
    

    //------------------------------------------------------------------------------
    // draw
    // Draw takes a card from the top of the deck, then discards a card from your hand.
    //------------------------------------------------------------------------------
    func draw() {
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
    }
    
    
    //------------------------------------------------------------------------------
    // toss
    // Toss draws the top card of the discard and then discards a card.
    //------------------------------------------------------------------------------
    func toss() {
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
    }
    
    
    //------------------------------------------------------------------------------
    // knock
    // Knock tests your score in a specific suit against your opponent's.
    // This ends the game - either the player or the opponent loses.
    //------------------------------------------------------------------------------
    func knock() {
        print("Choose your suit. Choices are Club, Diamond, Heart, and Spade.")
        let choice = readLine()
        print("You chose \(choice!)")
        var playerScore = 0
        for card in player.cards {
            if choice == card.suit {
                playerScore = playerScore + card.score
            }
        }
        endGame = true
    }
}
