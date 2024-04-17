//
//  Data.swift
//  DnD-Encounter-Creator
//
//  Created by Niels Jaspers on 12/04/2024.
//

import Foundation

let stats: [String] = [
    "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"
]

let savingThrows: [String] = [
    "Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"
]

var challengeRating: Float = 1      // Verander naar Input

var proficiencyBonus: Int = proficiencyBonus_by_ChallengeRating(ChallengeRating: challengeRating)

let sizeAndDie: [String: Int] = [
    "Tiny": 3,      // d4
    "Small": 4,     // d6
    "Medium": 5,    // d8
    "Large": 6,     // d10
    "Huge": 7,      // d12
    "Colossal": 11,  // d20
    "Titanic": 51   // d100
]

let hitDiceAmount: Int = Hitdice_Amount(ChallengeRating: challengeRating)

let abilityScores: [String:[Int]] = determineModifier(statDict: determineStats(stats: stats))
let abilityModifiers: [String:Int] = extractModifier(from: abilityScores)
