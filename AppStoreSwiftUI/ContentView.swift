//
//  ContentView.swift
//  AppStoreSwiftUI
//
//  Created by Matheus Timbó on 04/05/21.
//

import SwiftUI
import SwiftUIX

struct AppItem: Identifiable, Hashable {
    var id = UUID()
    
    let appClass: String
    let title: String
    let description: String
}

struct ContentView: View {
    @State var show = false
    @Namespace var namespace
    
    @State private var list = [
        AppItem(appClass: "Class1", title: "Title1", description: "Description1"),
        AppItem(appClass: "Class2", title: "Title2", description: "Description2"),
        AppItem(appClass: "Class3", title: "Title3", description: "Description3"),
        AppItem(appClass: "Class4", title: "Title4", description: "Description4"),
        AppItem(appClass: "Class5", title: "Title5", description: "Description5"),
        AppItem(appClass: "Class6", title: "Title6", description: "Description6"),
        AppItem(appClass: "Class7", title: "Title7", description: "Description7"),
        AppItem(appClass: "Class8", title: "Title8", description: "Description8"),
    ]
    
    @State private var selectedAppItem: AppItem = AppItem(appClass: "Class0", title: "Title0", description: "Description0")
    
    var body: some View {
        ZStack {
            VStack {
                Text("Hoje")
                    .font(.largeTitle).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                List(list) { item in
                    AppCard(namespace: namespace, appClass: item.appClass, appTitle: item.title, appDescription: item.description, id: item.id.uuidString)
                        .onTapGesture {
                            selectedAppItem = item
                            show.toggle()
                        }
                }
            }
            if show {
                DetailView(namespace: namespace, appItem: selectedAppItem)
                    .onTapGesture {
                        show.toggle()
                    }
            } 
            
        }.animation(.easeInOut(duration: 0.2))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
