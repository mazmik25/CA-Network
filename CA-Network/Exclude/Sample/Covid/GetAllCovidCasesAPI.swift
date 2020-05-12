//
//  GetAllCovidCasesAPI.swift
//  CA-Network
//
//  Created by Azmi Muhammad on 27/03/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

struct GetAllCovidCasesAPI: APISetup {
    var method: HttpMethod = .GET
    var path: String = "/countries"
    var parameters: [String : Any] = ["sort":"country"]
}
 
