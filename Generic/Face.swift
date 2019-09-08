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
enum Face {
    case Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
}

// Defines all the available faces
let faces: [Face] = [.Ace, .Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine, .Ten, .Jack, .Queen, .King]

// Specifies the score of each face.
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
