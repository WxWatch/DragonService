import Foundation

public struct MapsModel: Codable {
    public let type, version: String
    public let data: [String: MapDatum]
}

public struct MapDatum: Codable {
    public let mapName, mapID: String
    public let image: Image

    public enum CodingKeys: String, CodingKey {
        case mapName = "MapName"
        case mapID = "MapId"
        case image
    }
}
