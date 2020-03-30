//
//  PostLoginJaga2GoAPI.swift
//  CA-Network
//
//  Created by Azmi Muhammad on 27/03/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

import UIKit

struct PostLoginJaga2GoAPI: APISetup {
    var method: HTTPMethod = .POST
    var path: String = "/auth/login"
    var parameters: [String : Any] = [
        "email": "brayn@gmail.com",
        "password": "password",
        "device_id": "12891287"
    ]
}
