//
//  AlamofireAPISetup.swift
//  CA-Network
//
//  Created by Azmi Muhammad on 04/05/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

import Alamofire
public protocol AlamofireAPISetup {
    var method: HTTPMethod {get}
    var path: String {get}
    var parameters: [String:Any] {get}
    var headers: [String:String] {get}
}

extension AlamofireAPISetup {
    func setupUrl(env: APIEnvironment) -> String { return "\(env.setupUrl().absoluteString)\(path)" }
    func encoding() -> ParameterEncoding {
        return method == .get ? URLEncoding(destination: .queryString) : JSONEncoding.default
    }
}
