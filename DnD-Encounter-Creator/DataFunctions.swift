//
//  DataFunctions.swift
//  DnD-Encounter-Creator
//
//  Created by Niels Jaspers on 12/04/2024.
//

import Foundation

func determineStats(stats statList: [String]) -> [String:Int] {
    var statsDict: [String:Int] = [:]
    var randomInts: [Int] = [0, 0, 0, 0]
    var randomCalculated: Int = 0
    for stat in statList {
        randomCalculated = 0
        randomInts = [0, 0, 0, 0]

        for i in 0...3 {
            randomInts[i] = Int.random(in: 1...6)
        }
        randomInts.sort()
        randomInts.removeFirst()
        for int in randomInts {
            randomCalculated += int
        }
        statsDict[stat] = randomCalculated
    }
    
    return statsDict
}

func determineModifier(statDict statsDict: [String:Int]) -> [String:[Int]] {
    var statList_plus_Mod: [String:[Int]] = [:]
    
    for (key, value) in statsDict {
        var modifier: Int = 0

        switch value {
        case 1:
            modifier = -5
        case 2...3:
            modifier = -4
        case 4...5:
            modifier = -3
        case 6...7:
            modifier = -2
        case 8...9:
            modifier = -1
        case 10...11:
            modifier = 0
        case 12...13:
            modifier = 1
        case 14...15:
            modifier = 2
        case 16...17:
            modifier = 3
        case 18...19:
            modifier = 4
        case 20...21:
            modifier = 5
        case 22...23:
            modifier = 6
        case 24...25:
            modifier = 7
        case 26...27:
            modifier = 8
        case 28...29:
            modifier = 9
        case 30:
            modifier = 10
        default:
            modifier = 0
        }
        
        // Voeg de statistiek en modifier toe aan de dictionary
        statList_plus_Mod[key] = [value, modifier]
    }
    
    return statList_plus_Mod
}

func extractModifier(from dictionary: [String:[Int]]) -> [String:Int] {
    var result: [String:Int] = [:]
    
    for (key, value) in dictionary {
        result[key] = value[1]
    }
    
    return result
}

func Hitdice_Amount(ChallengeRating CR: Float) -> Int {
    
    switch (CR) {
    case 0.0:
        return 1
    case 0.125:
        return 2
    case 0.25:
        return 3
    case 0.5:
        return 4
    default:
        return Int(CR) + 4
    }
}

func proficiencyBonus_by_ChallengeRating(ChallengeRating CR: Float) -> Int {
    
    switch (CR) {
//    case 0...4:
//        return 2
    case 5...8:
        return 3
    case 9...12:
        return 4
    case 13...16:
        return 5
    case 17...20:
        return 6
    case 21...24:
        return 7
    case 25...28:
        return 8
    case 29...30:
        return 9
    default:
        return 2
    }
    
}

func XP_by_ChallengeRating(ChallengeRating CR: Float) -> Int {
    switch (CR) {
    case 0:
        return 10
    case 0.125:
        return 25
    case 0.25:
        return 50
    case 0.5:
        return 100
    case 1:
        return 200
    case 2:
        return 450
    case 3:
        return 700
    case 4:
        return 1100
    case 5:
        return 1800
    case 6:
        return 2300
    case 7:
        return 2900
    case 8:
        return 3900
    case 9:
        return 5000
    case 10:
        return 5900
    case 11:
        return 7200
    case 12:
        return 8400
    case 13:
        return 10000
    case 14:
        return 11500
    case 15:
        return 13000
    case 16:
        return 15000
    case 17:
        return 18000
    case 18:
        return 20000
    case 19:
        return 22000
    case 20:
        return 25000
    case 21:
        return 33000
    case 22:
        return 41000
    case 23:
        return 50000
    case 24:
        return 62000
    case 25:
        return 75000
    case 26:
        return 90000
    case 27:
        return 105000
    case 28:
        return 120000
    case 29:
        return 135000
    case 30:
        return 155000
    default:
        return 0 // Als de CR geen geldige waarde heeft, wordt 0 teruggegeven.
    }
}

