//
//  Class.swift
//  Cards
//
//  Created by Marcus Bamberger on 9/7/19.
//  Copyright © 2019 Marcus Bamberger. All rights reserved.
//

import Cocoa

enum Suit {
    case Spade, Diamond, Club, Heart
}
let Suits: [Suit] = [.Club, .Diamond, .Heart, .Spade]

enum Face {
    case Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
}
let faces: [Face] = [.Ace, .Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine, .Ten, .Jack, .Queen, .King]
let faceScore: [Face: Int] = [
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
    var face: Face
    var suit: Suit
    var score: Int
    var order = 0.0
    
    init(face faceIn: Face, suit suitIn: Suit, score scoreIn: Int) {
        face = faceIn
        score = scoreIn
        suit = suitIn
    }
    
    func show() {
        print("This card is the \(face) of \(face).")
    }
}
