//
//  ContentView.swift
//  Shared
//
//  Created by Rodolphe DUPUY on 16/09/2020.
//

import SwiftUI

struct ContentView: View {
    @StateObject var datas = Parser()
    @State var selection = 0
    var body: some View {
        TabView(selection: $selection,
                content:  {
                    GlobalView(parser: datas).tabItem {
                        Text("Données globales")
                        Image(systemName: "globe")
                    }.tag(1)
                    DepartementList(parser: datas).tabItem {
                        Text("Données départementales")
                        Image(systemName: "list.bullet")
                    }.tag(2)
                })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
