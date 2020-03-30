//
//  SampleModel.swift
//  CA-Network
//
//  Created by Azmi Muhammad on 27/03/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

import Foundation

struct GetAllCovidCasesBodyResponse: BasicResponse {
    typealias ResponseModel = GetAllCovidCasesFullBodyResponse
    var data: GetAllCovidCasesFullBodyResponse?
}

struct GetAllCovidCasesFullBodyResponse: Codable {
    let active : Int?
    let cases : Int?
    let casesPerOneMillion : Double?
    let country : String?
    let countryInfo : CountryInfo?
    let critical : Int?
    let deaths : Int?
    let deathsPerOneMillion : Double?
    let recovered : Int?
    let todayCases : Int?
    let todayDeaths : Int?
}

struct CountryInfo: Codable {
    let id : Int?
    let flag : String?
    let iso2 : String?
    let iso3 : String?
    let lat : Double?
    let longField : Double?
}
