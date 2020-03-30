//
//  ErrorCode.swift
//  CA-Network
//
//  Created by Azmi Muhammad on 30/03/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

public enum ErrorCode: Int {
    case verificationRequired = 100
    case success = 200
    case created = 201
    case accessTokenExpired = 401
    case notfound = 404
    case sessionExpired = 418
    case serviceUnavailable = 503
    case connectionLost = 0
    case none
}
