//
//  ViewController.swift
//  Sample CA Network
//
//  Created by Azmi Muhammad on 04/05/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

import UIKit
import CA_Network
import Alamofire

class ViewController: UIViewController {

    private let request = CARequestService<[GetAllCovidCasesFullBodyResponse]>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(reloadData))
        tapGesture.numberOfTapsRequired = 5
        view.addGestureRecognizer(tapGesture)
    }
    
    private func requestData() {
        request.request(environment: CovidEnvironment(), config: GetAllCovidCasesAPI(), onSuccess: { (responses) in
            DispatchQueue.main.async {
                self.showSimpleAlert(result: responses.first)
            }
        }) { (err) in
            DispatchQueue.main.async {
                self.showSimpleAlert(result: err)
            }
        }
    }
    
    private func requestWithAlamofire() {
        request.request(environment: CovidEnvironment(), config: GetAllCovidCasesAlamofireAPI(), onSuccess: { (responses) in
            DispatchQueue.main.async {
                self.showSimpleAlert(result: responses.first)
            }
        }) { (err) in
            DispatchQueue.main.async {
                self.showSimpleAlert(result: err)
            }
        }
    }
    
    private func multipart() {
        request.multipart(environment: CovidEnvironment(), config: GetAllCovidCasesAlamofireMultipartAPI(), onSuccess: { (responses) in
        }) { (error) in
            DispatchQueue.main.async {
                self.showSimpleAlert(result: error)
            }
        }
    }
    
    private func showSimpleAlert(result: Any?) {
        let alert = UIAlertController(title: "Result", message: "\(result)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func reloadData() {
        let alert = UIAlertController(title: "Select Type", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Multipart", style: .default, handler: { (_) in
            self.multipart()
            alert.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Covid19 with Alamofire", style: .default, handler: { (_) in
            self.requestWithAlamofire()
            alert.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Covid19 with URLSession", style: .default, handler: { (_) in
            self.requestData()
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }


}

struct CovidEnvironment: APIEnvironment {
    var staging: String = "https://corona.lmao.ninja"
    var production: String = "https://corona.lmao.ninja"
    var isDebug: Bool = true
    var token: String = ""
    var isConvertedFromSnakeCase: Bool = false
}

struct GetAllCovidCasesAPI: APISetup {
    var method: HttpMethod = .GET
    var path: String = "/v2/countries"
    var parameters: [String : Any] = ["sort":"country"]
}

struct GetAllCovidCasesAlamofireAPI: AlamofireAPISetup {
    var method: HTTPMethod = .get
    var path: String = "/v2/countries"
    var parameters: [String : Any] = ["sort":"country"]
    var headers: [String : String] = [:]
}

struct GetAllCovidCasesAlamofireMultipartAPI: AlamofireMultipartAPISetup {
    var multipartModels: [MultipartModel] = []
    var method: HTTPMethod = .get
    var path: String = "/v2/countries"
    var parameters: [String : Any] = ["sort":"country"]
    var headers: [String : String] = [:]
}
