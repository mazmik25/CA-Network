//
//  Response.swift
//  CA-Network
//
//  Created by Azmi Muhammad on 27/03/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

/// Protocol that handle response
/// If response doesn't have key "data", you just have to extend Codable
public protocol BasicResponse: Codable {
    associatedtype ResponseModel
    var data: ResponseModel? {get set}
}
