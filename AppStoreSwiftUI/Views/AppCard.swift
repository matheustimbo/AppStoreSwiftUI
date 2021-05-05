//
//  AppCard.swift
//  AppStoreSwiftUI
//
//  Created by Matheus Timbó on 04/05/21.
//

import SwiftUI
import SwiftUIX

struct AppCard: View {
    var namespace: Namespace.ID
    var appClass: String
    var appTitle: String
    var appDescription: String
    var id: String
    
   var body: some View {
        VStack(spacing: 0) {
            Text(appClass.uppercased()).font(.largeTitle).bold()
                .matchedGeometryEffect(id: "title\(id)", in: namespace)
                .frame(maxWidth: 150, maxHeight: .infinity, alignment: .bottomLeading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
               
            
            HStack {
                Image(uiImage: #imageLiteral(resourceName: "gato2"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 36, height: 36)
                    .cornerRadius(10)
                    .matchedGeometryEffect(id: "logo\(id)", in: namespace)
                VStack(alignment: .leading, spacing: 4) {
                    Text(appTitle)
                        .font(.body).bold().matchedGeometryEffect(id: "appname\(id)", in: namespace)
                    
                    Text(appDescription).font(.caption)
                        .matchedGeometryEffect(id: "description\(id)", in: namespace)
                }
                .foregroundColor(Color.white)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(12)
            .background(
                VisualEffectBlurView(blurStyle: .systemMaterialDark)
                    .matchedGeometryEffect(id: "blur\(id)", in: namespace))
        }
        .frame(maxWidth: .infinity, maxHeight: 335)
        .background(
        Image(uiImage: #imageLiteral(resourceName: "gato"))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .matchedGeometryEffect(id: "image\(id)", in: namespace)
        )
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "shape\(id)", in: namespace))
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
        .height(335)
        
    }
}

struct AppCard_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        AppCard(namespace: namespace, appClass: "App do dia", appTitle: "Título do App", appDescription: "Descrição do app", id: "0")
    }
}
