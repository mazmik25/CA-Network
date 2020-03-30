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
public struct MetaData: Codable {
    let code: Int
    let status: Bool
    let message: String
}

extension ResponseWithMetaData {
    func handle() -> Result<ResponseModel, Error> {
        if meta.status {
            if meta.code == ErrorCode.success.rawValue || meta.code == ErrorCode.created.rawValue {
                if let data = data {return .success(data)}
                else {return .failure(NSError(domain: "Object mapping failed", code: 400, userInfo: nil))}
            } else {return .failure(NSError(domain: meta.message, code: meta.code, userInfo: nil))}
        } else {
            return .failure(NSError(domain: meta.message, code: meta.code, userInfo: nil))
        }
    }
}
