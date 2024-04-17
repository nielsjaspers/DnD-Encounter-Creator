//
//  main.swift
//  DnD-Encounter-Creator
//
//  Created by Niels Jaspers on 12/04/2024.
//

import Foundation


//print(abilityScores)
//print(abilityModifiers)
//
print("Enter Name:")
let encounterName: String? = readLine()

print("Enter CR:")
let encounterCR: String? = readLine()
print("Enter Height:")
let encounterHeigth: String? = readLine()

print(determineHitpoints(diceAndSize: sizeAndDie, size: encounterHeigth!, diceAmount: hitDiceAmount))


let hitpoints = determineHitpoints(diceAndSize: sizeAndDie, size: encounterHeigth!, diceAmount: hitDiceAmount)
let strStat = abilityScores["Strength"]!
let dexStat = abilityScores["Dexterity"]!
let conStat = abilityScores["Constitution"]!
let intStat = abilityScores["Intelligence"]!
let wisStat = abilityScores["Wisdom"]!
let chaStat = abilityScores["Charisma"]!


// Lees de bestaande inhoud van het bestand
var existingContent = ""
// Lees het pad naar het Markdown-bestand uit FilePath.md in /Users
let filePathPath = "/Users/FilePath.md"
var filePath = ""
do {
    filePath = try String(contentsOfFile: filePathPath, encoding: .utf8)
} catch {
    print("Er is een fout opgetreden bij het lezen van het bestand FilePath.md: \(error)")
}

// Verwijder eventuele nieuwe regels en spaties aan het einde van het pad
filePath = filePath.trimmingCharacters(in: .whitespacesAndNewlines)

do {
    existingContent = try String(contentsOf: URL(fileURLWithPath: filePath), encoding: .utf8)
} catch {
    print("Er is een fout opgetreden bij het lezen van het bestand: \(error)")
}

// Creëer de nieuwe inhoud voor het Markdown-bestand
let newContent = """
# \(encounterName!)
\(encounterHeigth!) Race, Any
___
**Armor Class** 10
**Hit Points** \(hitpoints) (\(hitDiceAmount)\(determine_Hitdice(size: encounterHeigth)))
**Speed 10m**
___
**STR** \(strStat[0]) (\(strStat[1]))
**DEX** \(dexStat[0]) (\(dexStat[1]))
**CON** \(conStat[0]) (\(conStat[1]))
**INT** \(intStat[0]) (\(intStat[1]))
**WIS** \(wisStat[0]) (\(wisStat[1]))
**CHA** \(chaStat[0]) (\(chaStat[1]))
___
**Proficiency Bonus** +\(proficiencyBonus_by_ChallengeRating(ChallengeRating: Float(encounterCR!)!))
**Passive**
**Language**
**Challenge Rating** \(encounterCR!) (\(XP_by_ChallengeRating(ChallengeRating: Float(encounterCR!)!)) XP)
"""

// Combineer de bestaande inhoud met de nieuwe inhoud
let combinedContent = existingContent + "\n\n" + newContent

// Schrijf de gecombineerde inhoud naar het Markdown-bestand
do {
    try combinedContent.write(to: URL(fileURLWithPath: filePath), atomically: true, encoding: .utf8)
    print("De gegevens zijn succesvol toegevoegd aan het bestand: \(filePath)")
} catch {
    print("Er is een fout opgetreden bij het schrijven naar het bestand: \(error)")
}
