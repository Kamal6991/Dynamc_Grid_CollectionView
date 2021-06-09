//
//  ObjectMapper.swift
//  DynamicCollectionViewlayout
//
//  Created by Kamal Sharma on 09/06/21.
//  Copyright © 2021 Kamal Sharma. All rights reserved.
//

import Foundation

struct ObjectMapper {
    static func parseJson<T: Codable>(data: Data?, type: T.Type) -> Result<T, GenericError>? {
        if let dataRec = data {
            do {
                let result = try JSONDecoder().decode(T.self, from: dataRec)
                return .success(result)
            } catch {
                return .failure(.decodingError)
            }
        } else {
            return .failure(.dataFailure)
        }
    }
}
