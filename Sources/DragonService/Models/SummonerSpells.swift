//
//  SummonerSpells.swift
//  dragon-service
//
//  Created by James Glenn on 9/4/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

public struct SummonerSpells: Codable {
    public let type, version: String
    public let data: [String: SummonerSpellsDatum]
}

public struct SummonerSpellsDatum: Codable {
    public let id, name, description, tooltip: String
    public let maxrank: Int
    public let cooldown: [Int]
    public let cooldownBurn: String
    public let cost: [Int]
    public let costBurn: String
    public let effect: [[Double]?]
    public let effectBurn: [String?]
    public let vars: [Var]
    public let key: String
    public let summonerLevel: Int
    public let modes: [String]
    public let costType: String
    public let maxammo: String
    public let range: [Int]
    public let rangeBurn: String
    public let image: Image
    public let resource: String
    public let leveltip: Leveltip?
}

public struct Var: Codable {
    public let link: String
    public let coeff: Coeff
    public let key: String
}
