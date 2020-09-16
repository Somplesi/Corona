//
//  DepartementView.swift
//  Corona
//
//  Created by Rodolphe DUPUY on 16/09/2020.
//

import SwiftUI

struct DepartementView: View {
    var departement: Departement
    var body: some View {
        VStack {
            ZStack {
                Image("world")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 100, alignment: .center)
                    .clipped()
                Text(departement.nom)
                    .font(.title)
                    .padding(.all, 20)
                    .background(Color.secondary)
                    .cornerRadius(20)
            }
            Form(content: {
                ListView(key: "Code", value: departement.code)
                ListView(key: "Date", value: departement.date)
                ListView(key: "Hospitalisés", value: "\(departement.hospitalises)")
                ListView(key: "Réanimations", value: "\(departement.reanimation)")
                ListView(key: "Décès", value: "\(departement.deces)")
                ListView(key: "Guéris", value: "\(departement.gueris)")
            })
        }
    }
}

struct DepartementView_Previews: PreviewProvider {
    static var previews: some View {
        DepartementView(departement: Parser().departements[0])
    }
}
