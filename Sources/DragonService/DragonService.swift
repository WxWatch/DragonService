//
//  DragonService.swift
//  dragon-service
//
//  Created by James Glenn on 9/8/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation
import Alamofire

public class DragonService {
    let baseUrl = "https://ddragon.leagueoflegends.com"

    public init() {}

    private func buildUrl(base: String, paths: [String]) -> URL? {
        var urlString = base
        for path in paths {
            urlString.append("/\(path)")
        }

        return URL(string: urlString)
    }

    private func fetch(paths: [String]) -> DataRequest? {
        guard let url = buildUrl(base: baseUrl, paths: paths) else {
            return nil
        }

        return Alamofire.request(url)
    }

    private func fetchApi(endpoint: String) -> DataRequest? {
        return fetchApi(paths: [endpoint])
    }

    private func fetchApi(paths: [String]) -> DataRequest? {
        return fetch(paths: [DragonService.ServiceConstants.Api.rawValue] + paths)
    }

    private func fetchCdn(version: String, locale: String, endpoint: String) -> DataRequest? {
        return fetchCdn(paths: [version, DragonService.UrlConstants.Data.rawValue, locale, endpoint])
    }

    private func fetchCdn(endpoint: String) -> DataRequest? {
        return fetchCdn(paths: [endpoint])
    }

    private func fetchCdn(paths: [String]) -> DataRequest? {
        return fetch(paths: [DragonService.ServiceConstants.Cdn.rawValue] + paths)
    }

    private func fetchRealms(endpoint: String) -> DataRequest? {
        return fetch(paths: [DragonService.ServiceConstants.Realms.rawValue, endpoint])
    }

    public class Champion: DragonService {
        public override init() {
            super.init()
        }

        public func list(version: String, locale: String, completionHandler: @escaping (Any?) -> Void) {
            list(version: version, locale: locale, full: false, completionHandler: completionHandler)
        }

        public func list(version: String, locale: String, full: Bool, completionHandler: @escaping (Champions) -> Void) {
            let endpoint = full ? DragonService.EndpointConstants.ChampionsFull : DragonService.EndpointConstants.Champions

            guard let response = fetchCdn(version: version, locale: locale, endpoint: endpoint.rawValue) else {
                return
            }

            response.responseChampions { response in
                if let champions = response.result.value {
                    completionHandler(champions)
                }
            }
        }

        public func get(version: String, locale: String, champion: String, completionHandler: @escaping (Champions) -> Void) {
            guard let response = fetchCdn(paths: [version, DragonService.UrlConstants.Data.rawValue, locale, DragonService.UrlConstants.Champion.rawValue, "\(champion).json"]) else {
                return
            }

            response.responseChampions { response in
                if let champions = response.result.value {
                    completionHandler(champions)
                }
            }
        }
    }

    public class Item: DragonService {
        public override init() {
            super.init()
        }

        public func list(version: String, locale: String, completionHandler: @escaping (ItemsModel) -> Void) {
            guard let response = fetchCdn(version: version, locale: locale, endpoint: DragonService.EndpointConstants.Items.rawValue) else {
                return
            }

            response.responseItems { response in
                if let items = response.result.value {
                    completionHandler(items)
                }
            }
        }
    }

    public class Language: DragonService {
        public override init() {
            super.init()
        }

        public func list(completionHandler: @escaping (Array<String>) -> Void) {
            guard let response = fetchCdn(endpoint: DragonService.EndpointConstants.Languages.rawValue) else {
                return
            }

            response.responseJSON { response in
                completionHandler(response.result.value as! Array<String>)
            }
        }

        public func get(version: String, locale: String, completionHandler: @escaping (LanguageModel) -> Void) {
            guard let response = fetchCdn(version: version, locale: locale, endpoint: DragonService.EndpointConstants.Language.rawValue) else {
                return
            }

            response.responseLanguage { response in
                if let language = response.result.value {
                    completionHandler(language)
                }
            }
        }
    }

    public class Mastery: DragonService {
        public override init() {
            super.init()
        }

        public func list(version: String, locale: String, completionHandler: @escaping (Masteries) -> Void) {
            guard let response = fetchCdn(version: version, locale: locale, endpoint: DragonService.EndpointConstants.Masteries.rawValue) else {
                return
            }

            response.responseMasteries { response in
                if let masteries = response.result.value {
                    completionHandler(masteries)
                }
            }
        }
    }

    public class ProfileIcon: DragonService {
        public override init() {
            super.init()
        }

        public func list(version: String, locale: String, completionHandler: @escaping (ProfileIcons) -> Void) {
            guard let response = fetchCdn(version: version, locale: locale, endpoint: DragonService.EndpointConstants.ProfileIcons.rawValue) else {
                return
            }

            response.responseProfileIcons { response in
                if let profileIcons = response.result.value {
                    completionHandler(profileIcons)
                }
            }
        }
    }

    public class Realm: DragonService {
        public override init() {
            super.init()
        }

        public func list(region: RegionConstants, completionHandler: @escaping (Realms) -> Void) {
            guard let response = fetchRealms(endpoint: "\(region.rawValue.lowercased()).json") else {
                return
            }

            response.responseRealms { response in
                if let realms = response.result.value {
                    completionHandler(realms)
                }
            }
        }
    }

    public class Rune: DragonService {
        public override init() {
            super.init()
        }

        public func list(version: String, locale: String, completionHandler: @escaping (Runes) -> Void) {
            guard let response = fetchCdn(version: version, locale: locale, endpoint: DragonService.EndpointConstants.Runes.rawValue) else {
                return
            }

            response.responseRunes { response in
                if let runes = response.result.value {
                    completionHandler(runes)
                }
            }
        }
    }

    public class SummonerSpell: DragonService {
        public override init() {
            super.init()
        }

        public func list(version: String, locale: String, completionHandler: @escaping (SummonerSpells) -> Void) {
            guard let response = fetchCdn(version: version, locale: locale, endpoint: DragonService.EndpointConstants.SummonerSpells.rawValue) else {
                return
            }

            response.responseSummonerSpells { response in
                if let summonerSpells = response.result.value {
                    completionHandler(summonerSpells)
                }
            }
        }
    }

    public class Version: DragonService {
        public override init() {
            super.init()
        }

        public func list(completionHandler: @escaping (Array<String>) -> Void) {
            guard let response = fetchApi(endpoint: DragonService.EndpointConstants.Versions.rawValue) else {
                return
            }

            response.responseJSON { response in
                completionHandler(response.result.value as! Array<String>)
            }
        }
    }

}

extension DragonService {
    private enum UrlConstants: String {
        case Data = "data"
        case Champion = "champion"
    }

    public enum RegionConstants: String {
        case RU = "RU"
        case BR = "BR"
        case OCE = "OCE"
        case JP = "JP"
        case NA = "NA"
        case EUNE = "EUNE"
        case EUW = "EUW"
        case TR = "TR"
        case LAN = "LAN"
        case LAS = "LAS"
    }

    private enum ServiceConstants: String {
        case Cdn = "cdn"
        case Api = "api"
        case Realms = "realms"
    }

    private enum EndpointConstants: String {
        case Language = "language.json"
        case Languages = "languages.json"
        case Versions = "versions.json"
        case ProfileIcons = "profileicon.json"
        case Champions = "champion.json"
        case ChampionsFull = "championFull.json"
        case Items = "item.json"
        case Masteries = "mastery.json"
        case Runes = "rune.json"
        case SummonerSpells = "summoner.json"
    }
}
