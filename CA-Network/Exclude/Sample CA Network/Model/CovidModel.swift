//
//  CovidModel.swift
//  Sample CA Network
//
//  Created by Azmi Muhammad on 06/05/20.
//  Copyright © 2020 Clapping Ape. All rights reserved.
//

import CA_Network

struct GetAllCovidCasesFullBodyResponse: Codable {
    let active : Int?
    let cases : Int?
    let casesPerOneMillion : Double?
    let country : String?
    let countryInfo : CountryInfoResponse?
    let critical : Int?
    let deaths : Int?
    let deathsPerOneMillion : Double?
    let recovered : Int?
    let todayCases : Int?
    let todayDeaths : Int?
}

struct CountryInfoResponse: Codable {
    let id : Int?
    let flag : String?
    let iso2 : String?
    let iso3 : String?
    let lat : Double?
    let longField : Double?
}

struct GetAllCovidCasesFullBodyOutput: Codable {
    let active : Int
    let cases : Int
    let casesPerOneMillion : Double
    let country : String
    let countryInfo : CountryInfoOutput?
    let critical : Int
    let deaths : Int
    let deathsPerOneMillion : Double
    let recovered : Int
    let todayCases : Int
    let todayDeaths : Int
}

struct CountryInfoOutput: Codable {
    let id : Int
    let flag : String
    let iso2 : String
    let iso3 : String
    let lat : Double
    let longField : Double
}
