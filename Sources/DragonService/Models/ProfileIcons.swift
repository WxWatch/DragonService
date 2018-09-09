//
//  ProfileIcons.swift
//  dragon-service
//
//  Created by James Glenn on 9/3/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

public struct ProfileIcons: Codable {
    public let type, version: String
    public let data: [String: ProfileIconsDatum]
}

public struct ProfileIconsDatum: Codable {
    public let id: Int
    public let image: Image
}
