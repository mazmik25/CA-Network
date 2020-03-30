//
//  ResponseWithMessageAndErrorCode.swift
//  CA-Network
//
//  Created by Azmi Muhammad on 30/03/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

/// Protocol that handle message and error code inside body response
public protocol ResponseWithMessageAndErrorCode: BasicResponse {
    var message: String? {get set}
    var errorCode: Int {get set}
}
