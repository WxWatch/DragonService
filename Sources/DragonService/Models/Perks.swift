//
//  Perks.swift
//  dragon-service
//
//  Created by James Glenn on 10/4/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

public typealias Perks = [Perk]

public struct Perk: Codable {
    public let id: Int
    public let key, icon, name: String
    public let slots: [Slot]
}

public struct Slot: Codable {
    public let runes: [PerkRune]
}

public struct PerkRune: Codable {
    public let id: Int
    public let key, icon, name, shortDesc: String
    public let longDesc: String
}
