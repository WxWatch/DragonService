//
//  Realms.swift
//  dragon-service
//
//  Created by James Glenn on 9/3/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

public struct Realms: Codable {
    public let n: N
    public let v, l, cdn, dd: String
    public let lg, css: String
    public let profileiconmax: Int
    public let store: JSONNull?
}

public struct N: Codable {
    public let item, rune, mastery, summoner: String
    public let champion, profileicon, map, language: String
    public let sticker: String
}
