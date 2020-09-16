//
//  DataModel.swift
//  Corona
//
//  Created by Rodolphe DUPUY on 16/09/2020.
//

import Foundation
 
struct GlobalData: Decodable {
//    {"FranceGlobalLiveData":[{"date":"2020-09-15","source":{"nom":"Ministère des Solidarités et de la Santé"},"sourceType":"ministere-sante","casConfirmes":395104,"deces":20471,"decesEhpad":10528,"hospitalises":5679,"reanimation":759,"gueris":89891,"casConfirmesEhpad":42047,"nouvellesHospitalisations":642,"nouvellesReanimations":117,"nom":"France","code":"FRA"},{"code":"FRA","nom":"France","date":"2020-09-15","hospitalises":5660,"reanimation":752,"nouvellesHospitalisations":642,"nouvellesReanimations":117,"deces":20447,"gueris":89861,"source":{"nom":"OpenCOVID19-fr"},"sourceType":"opencovid19-fr"}]}
    var FranceGlobalLiveData: [HealthData]
}
 
struct HealthData: Decodable {
    var date: String
    var source: Source
    var sourceType: String
    var casConfirmes: Int?
    var deces: Int
    var decesEhpad: Int?
    var hospitalises: Int
    var reanimation: Int
    var gueris: Int
    var casConfirmesEhpad: Int?
    var nouvellesHospitalisations: Int?
    var nouvellesReanimations: Int?
    var nom: String
    var code: String
}
 
struct Source: Decodable {
    var nom: String
}
 
struct AllDatas: Decodable {
    // {"allLiveFranceData":[{"code":"DEP-01","nom":"Ain","date":"2020-09-15","hospitalises":34,"reanimation":1,"nouvellesHospitalisations":9,"nouvellesReanimations":1,"deces":110,"gueris":471,"source":{"nom":"Santé publique France Data"},"sourceType":"sante-publique-france-data"},
    var allLiveFranceData: [Departement]
}
 
struct Departement: Decodable {
    var code: String
    var nom: String
    var date: String
    var hospitalises: Int
    var reanimation: Int
    var deces: Int
    var gueris: Int
    var source: Source
}
