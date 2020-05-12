//
//  AlamofireMultipartSetup.swift
//  CA-Network
//
//  Created by Azmi Muhammad on 04/05/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

import Foundation

public protocol AlamofireMultipartAPISetup: AlamofireAPISetup {
    var multipartModels: [MultipartModel] { get }
}

open class MultipartModel {
    public let data: Data?
    public let key: String
    public let fileName: String
    public let mimeType: MimeType
    
    init(data: Data?, key: String, fileName: String, mimeType: MimeType) {
        self.data = data
        self.key = key
        self.fileName = fileName
        self.mimeType = mimeType
    }
}

public enum MimeType: String {
    case image = "image/jpg"
    case video = "video/mp4"
}
