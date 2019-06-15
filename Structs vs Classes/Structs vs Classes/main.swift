//
//  main.swift
//  Structs vs Classes
//
//  Created by Naaman Curtis on 15/06/2019.
//  Copyright © 2019 Naaman Curtis. All rights reserved.
//

import Foundation

/*
 Apples Position:
 - You should use a Struct by default
 
 There are two scenarios where you should turn something into a Class
 1. You need to use Inheritance
 2. You need to work with Objective-C code - ie. APIs etc
 */

// Classes are Reference Type Objects

var hero = Classhero(name: "Ironman", universe: "Marvel")
var anotherMarvelHero = hero
anotherMarvelHero.name = "The Hulk"

print("=== Classes ===")
print(hero.name) // The Hulk
print(anotherMarvelHero.name) // The Hulk
print()

// Structs are Stored Objects
var villain = Structhero(name: "Aries", universe: "DC")
var anotherDCVillain = villain
anotherDCVillain.name = "Bizzaro Superman"

print("=== Structs ===")
print(villain.name) // Aries
print(anotherDCVillain.name) // Bizzaro Superman
print()

// Class Immutability
let hero2 = Classhero(name: "Batman", universe: "DC") // Despite the fact that hero2 is a constant
hero2.name = "Superman" // The name within the Class is actually a variable, meaning we can re-assign it at runtime

// Struct Immutability
let villain2 = Structhero(name: "Thanos", universe: "Marvel") // Genuinely immutable if let is used
// villain2.name = "Loki" // The compiler would not allow this
