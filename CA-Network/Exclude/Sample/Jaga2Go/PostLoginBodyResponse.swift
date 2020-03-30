//
//  PostLoginBodyResponse.swift
//  CA-Network
//
//  Created by Azmi Muhammad on 27/03/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

import UIKit

struct PostLoginBodyResponse: ResponseWithMetaData {
    typealias ResponseModel = PostLoginFullBodyResponse
    var data: PostLoginFullBodyResponse?
    var meta: MetaData
}

struct PostLoginFullBodyResponse: Codable {
    let authToken: String
}
