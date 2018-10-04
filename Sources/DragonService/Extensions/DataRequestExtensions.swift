//
//  DataRequestExtensions.swift
//  dragon-service
//
//  Created by James Glenn on 9/8/18.
//

import Foundation
import Alamofire

extension DataRequest {
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }

            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }

            return Result { try JSONDecoder.newJSONDecoder().decode(T.self, from: data) }
        }
    }

    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }

    @discardableResult
    func responseRealms(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Realms>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }

    @discardableResult
    func responseProfileIcons(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<ProfileIcons>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }

    @discardableResult
    func responseItems(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<ItemsModel>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }

    @discardableResult
    func responseMasteries(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Masteries>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }

    @discardableResult
    func responseRunes(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Runes>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }

    @discardableResult
    func responseSummonerSpells(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<SummonerSpells>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }

    @discardableResult
    func responseLanguage(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<LanguageModel>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }

    @discardableResult
    func responseChampions(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Champions>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }

    @discardableResult
    func responsePerks(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Perks>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
