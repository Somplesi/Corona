//
//  ListView.swift
//  Corona
//
//  Created by Rodolphe DUPUY on 16/09/2020.
//

import SwiftUI

struct ListView: View {
    var key: String
    var value: String
    var body: some View {
        HStack {
            Image(systemName: "bandage")
            Spacer()
            VStack(alignment: .trailing) {
                Text(key)
                    .italic()
                Text(value)
                    .bold()
                    .foregroundColor(.red)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(key: "Nombre de cas", value: "45")
    }
}
