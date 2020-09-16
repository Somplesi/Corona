//
//  GlobalView.swift
//  Corona
//
//  Created by Rodolphe DUPUY on 16/09/2020.
//

import SwiftUI

struct GlobalView: View {
    @StateObject var parser: Parser
    var body: some View {
        NavigationView {
            Form {
                if (parser.globalDatas.count > 0) {
                    Text("Données mises à jour le: \(parser.globalDatas[0].date)")
                }
                ForEach(parser.globalDatas, id: \.sourceType) {
                    data in Section(header: HStack {
                        Image("monalisa")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60, alignment: .center)
                            .clipShape(Circle())
                        Text(data.sourceType)
                    }) {
                        // if (data.casConfirmes != nil) {
                        //      ListView(key: "Nombre de cas", value: "\(data.casConfirmes!)")  =>
                        if let cas = data.casConfirmes {
                            ListView(key: "Nombre de cas", value: "\(cas)")
                        }
                        ListView(key: "Décès", value: "\(data.deces)")
                        if let decesEhpad = data.decesEhpad {
                            ListView(key: "Décès Ehpad", value: "\(decesEhpad)")
                        }
                        ListView(key: "Hospitalisés", value: "\(data.hospitalises)")
                        ListView(key: "Réanimation", value: "\(data.reanimation)")
                        ListView(key: "Guéris", value: "\(data.gueris)")
                        if let casEhpad = data.casConfirmesEhpad {
                            ListView(key: "Cas Ehpad", value: "\(casEhpad)")
                        }
                        if let newHospitalisation = data.nouvellesHospitalisations {
                            ListView(key: "Nouvelles hospitalisations", value: "\(newHospitalisation)")
                        }
                        if let newReanimation = data.nouvellesHospitalisations {
                            ListView(key: "Nouvelles réanimations", value: "\(newReanimation)")
                        }
                    }
                }
            }.navigationTitle("Données nationales")
        }.onAppear {
            parser.getGeneral()
        }
    }
}

struct GlobalView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalView(parser: Parser())
    }
}
