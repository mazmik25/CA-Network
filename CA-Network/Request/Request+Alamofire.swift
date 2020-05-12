//
//  Request+Extension.swift
//  CA-Network
//
//  Created by Azmi Muhammad on 04/05/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

import Alamofire
extension CARequestService {
    public func request(environment: APIEnvironment, config: AlamofireAPISetup, onSuccess: OnSuccess<T>, onFailure: OnFailure) {
        Alamofire.request(config.setupUrl(env: environment), method: config.method, parameters: config.parameters, encoding: config.encoding(), headers: config.headers).responseJSON { response in
            let result = self.setupResult(data: response.data, env: environment)
            switch result {
            case .success(let model):
                onSuccess?(model)
            case .failure(let err):
                onFailure?(err.localizedDescription)
            }
        }
    }
    
    public func multipart(environment: APIEnvironment, config: AlamofireMultipartAPISetup, onSuccess: OnSuccess<T>, onFailure: OnFailure) {
        Alamofire.upload(multipartFormData: { (multipartData) in
            for (key, value) in config.parameters {
                if let value = value as? String, let data = value.data(using: .utf8) {
                    multipartData.append(data, withName: key)
                }
            }
            config.multipartModels.forEach { (model) in
                if let data = model.data {
                    multipartData.append(data, withName: model.key, fileName: model.fileName, mimeType: model.mimeType.rawValue)
                }
            }
        }, to: config.setupUrl(env: environment), method: config.method, headers: config.headers) { result in
            switch result {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    let result = self.setupResult(data: response.data, env: environment)
                    switch result {
                    case .success(let model):
                        onSuccess?(model)
                    case .failure(let err):
                        onFailure?(err.localizedDescription)
                    }
                }
            case .failure(let error):
                let err = error as NSError
                onFailure?(err.domain)
            }
        }
    }
}
