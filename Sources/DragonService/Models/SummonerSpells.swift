//
//  SummonerSpells.swift
//  dragon-service
//
//  Created by James Glenn on 9/4/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

struct SummonerSpells: Codable {
    let type, version: String
    let data: [String: SummonerSpellsDatum]
}

struct SummonerSpellsDatum: Codable {
    let id, name, description, tooltip: String
    let maxrank: Int
    let cooldown: [Int]
    let cooldownBurn: String
    let cost: [Int]
    let costBurn: String
    let effect: [[Double]?]
    let effectBurn: [String?]
    let vars: [Var]
    let key: String
    let summonerLevel: Int
    let modes: [String]
    let costType: String
    let maxammo: String
    let range: [Int]
    let rangeBurn: String
    let image: Image
    let resource: String
    let leveltip: Leveltip?
}

struct Var: Codable {
    let link: String
    let coeff: Coeff
    let key: String
}
