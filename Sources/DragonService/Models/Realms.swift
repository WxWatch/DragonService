//
//  Realms.swift
//  dragon-service
//
//  Created by James Glenn on 9/3/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

struct Realms: Codable {
    let n: N
    let v, l, cdn, dd: String
    let lg, css: String
    let profileiconmax: Int
    let store: JSONNull?
}

struct N: Codable {
    let item, rune, mastery, summoner: String
    let champion, profileicon, map, language: String
    let sticker: String
}
