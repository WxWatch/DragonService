//
//  ProfileIcons.swift
//  dragon-service
//
//  Created by James Glenn on 9/3/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

public struct ProfileIcons: Codable {
    let type, version: String
    let data: [String: ProfileIconsDatum]
}

public struct ProfileIconsDatum: Codable {
    let id: Int
    let image: Image
}
