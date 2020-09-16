//
//  Parser.swift
//  Corona
//
//  Created by Rodolphe DUPUY on 16/09/2020.
//

import Foundation

class Parser: ObservableObject {
    // https://www.data.gouv.fr/fr/reuses/coronavirusapi-france/
    // https://github.com/florianzemma/CoronavirusAPI-France
    let general: String = "https://coronavirusapi-france.now.sh/FranceLiveGlobalData"
    let departement: String = "https://coronavirusapi-france.now.sh/AllLiveData"
    
    @Published var globalDatas: [HealthData] = []
    @Published var departements: [Departement] = []
    
    func getGeneral() {
        if let url = URL(string: general) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let fichierJSON = data {
                    do {
                        let result = try JSONDecoder().decode(GlobalData.self, from: fichierJSON)
                        DispatchQueue.main.async {
                            self.globalDatas = result.FranceGlobalLiveData
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }
    
    func getRegional() {
        if let url = URL(string: departement) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let fichierJSON = data {
                    do {
                        let result = try JSONDecoder().decode(AllDatas.self, from: fichierJSON)
                        DispatchQueue.main.async {
                            self.departements = result.allLiveFranceData
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }
}
