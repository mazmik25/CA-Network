//
//  ResponseWithMetaData.swift
//  CA-Network
//
//  Created by Azmi Muhammad on 30/03/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

/// Protocol that handle response with meta data
public protocol ResponseWithMetaData: BasicResponse {
    var meta: MetaData {get set}
}

/// Meta Data from response
open class MetaData: Codable {
    public let code: Int
    public let status: Bool
    public let message: String
}

extension ResponseWithMetaData {
    public func handle() -> Result<ResponseModel, Error> {
        if meta.status {
            if 200...299 ~= meta.code {
                if let data = data {return .success(data)}
                else {return .failure(NSError(domain: "Object mapping failed", code: 400, userInfo: nil))}
            } else {return .failure(NSError(domain: meta.message, code: meta.code, userInfo: nil))}
        } else {
            return .failure(NSError(domain: meta.message, code: meta.code, userInfo: nil))
        }
    }
}
