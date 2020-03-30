//
//  CovidEnvironment.swift
//  CA-Network
//
//  Created by Azmi Muhammad on 27/03/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

struct CovidEnvironment: APIEnvironment {
    var staging: String = "https://corona.lmao.ninja"
    var production: String = "https://corona.lmao.ninja"
    var isDebug: Bool = true
    var token: String = ""
    var isConvertedFromSnakeCase: Bool = false
}
