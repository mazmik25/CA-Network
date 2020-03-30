//
//  CA_NetworkTests.swift
//  CA_NetworkTests
//
//  Created by Azmi Muhammad on 27/03/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

import XCTest
@testable import CA_Network

class CA_NetworkTests: XCTestCase {

    var requestBasic: Request<[GetAllCovidCasesFullBodyResponse]>!
    var requestMeta: Request<PostLoginBodyResponse>!
    
    override func setUp() {
        requestBasic = Request<[GetAllCovidCasesFullBodyResponse]>()
        requestMeta = Request<PostLoginBodyResponse>()
    }

    override func tearDown() {
        requestBasic = nil
        requestMeta = nil
    }

    func testExample() {
        let e = expectation(description: "Covid testing")
        requestBasic.request(environment: CovidEnvironment(), config: GetAllCovidCasesAPI(), onSuccess: { (responses) in
            XCTAssertNotNil(responses, "We got the response! \(responses)")
            print(responses)
            e.fulfill()
        }) { (err) in
            XCTAssertNil(err, "Whoops, error \(err)")
            e.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testWithMeta() {
        let e = expectation(description: "Jaga2Go testing")
        requestMeta.request(environment: Jaga2GoEnvironment(), config: PostLoginJaga2GoAPI(), onSuccess: { (response) in
            XCTAssertNotNil(response, "We got the response! \(response)")
            print(response)
            e.fulfill()
        }) { (err) in
            XCTAssertNil(err, "Whoops, error \(err)")
            e.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }

    func testDownloadImage() {
        let e = expectation(description: "Image downloading test")
        let url: URL = URL(string: "https://raw.githubusercontent.com/NovelCOVID/API/master/assets/flags/id.png")!
        requestBasic.downloadImage(from: url) { (result) in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data, "We got the response! \(data.base64EncodedString())")
                print(data.base64EncodedString())
                e.fulfill()
            case .failure(let err):
                XCTAssertNil(err, "Whoops, error \(err)")
                e.fulfill()
            }
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
