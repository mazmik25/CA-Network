//
//  Jaga2GoEnvironment.swift
//  CA-Network
//
//  Created by Azmi Muhammad on 27/03/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

import UIKit

class Jaga2GoEnvironment: APIEnvironment {
    var staging: String = "https://api.jaga2go.ptape.com"
    var production: String = "https://api.jaga2go.ptape.com"
    var isDebug: Bool = true
    var token: String = ""
    var isConvertedFromSnakeCase: Bool = true
}
