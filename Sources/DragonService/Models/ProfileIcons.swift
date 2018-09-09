//
//  ProfileIcons.swift
//  dragon-service
//
//  Created by James Glenn on 9/3/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

struct ProfileIcons: Codable {
    let type, version: String
    let data: [String: ProfileIconsDatum]
}

struct ProfileIconsDatum: Codable {
    let id: Int
    let image: Image
}
