//
//  APIEnvironment.swift
//  CA-Network
//
//  Created by Azmi Muhammad on 27/03/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

import Foundation
/// Protocol for setup base URL for project
/// it can be inisiated to multiple object
public protocol APIEnvironment {
    var staging: String {get}
    var production: String {get}
    var isDebug: Bool {get}
    var token: String {get}
    var isConvertedFromSnakeCase: Bool {get}
}

extension APIEnvironment {
    func setupUrl() -> URL {
        guard let stagingURL: URL = URL(string: staging), let productionURL: URL = URL(string: production) else {
            fatalError("Bad endpoint. Here's your setup \nstaging: \(staging)\nproduction \(production)")
        }
        
        if isDebug { return stagingURL }
        else { return productionURL }
    }
    
    func decoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        if isConvertedFromSnakeCase { decoder.keyDecodingStrategy = .convertFromSnakeCase }
        
        return decoder
    }
}
