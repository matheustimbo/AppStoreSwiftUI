//
//  DetailView.swift
//  AppStoreSwiftUI
//
//  Created by Matheus Timbó on 04/05/21.
//

import SwiftUI
import SwiftUIX

struct DetailView: View {
    var namespace: Namespace.ID
    @State var appItem: AppItem
    @State var appear = false
    
    var body: some View {
        VStack(spacing: 16) {
            
            VStack(spacing: 0) {
                Text(appItem.appClass.uppercased()).font(.largeTitle).bold()
                    .matchedGeometryEffect(id: "title\(appItem.id.uuidString)", in: namespace)
                    .frame(maxWidth: 150, maxHeight: .infinity, alignment: .bottomLeading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                   
                
                HStack {
                    Image(uiImage: #imageLiteral(resourceName: "gato2"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 36, height: 36)
                        .cornerRadius(10)
                        .matchedGeometryEffect(id: "logo\(appItem.id.uuidString)", in: namespace)
                        
                    VStack(alignment: .leading, spacing: 4) {
                        Text(appItem.title)
                            .font(.body).bold()
                            .matchedGeometryEffect(id: "appname\(appItem.id.uuidString)", in: namespace)
                        Text(appItem.description).font(.caption)
                        .matchedGeometryEffect(id: "description\(appItem.id.uuidString)", in: namespace)
                    }
                    .foregroundColor(Color.white)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(12)
                .background(
                    VisualEffectBlurView(blurStyle: .systemMaterialDark)
                        .matchedGeometryEffect(id: "blur\(appItem.id.uuidString)", in: namespace)
                )
            }
            .frame(maxWidth: .infinity, maxHeight: 500)
            .background(
            Image(uiImage: #imageLiteral(resourceName: "gato"))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image\(appItem.id.uuidString)", in: namespace)
            )
            .mask(RoundedRectangle(cornerRadius: 0, style: .continuous).matchedGeometryEffect(id: "shape\(appItem.id.uuidString)", in: namespace))
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                .padding()
                .offset(y: appear ? 0 : -300)
                .onAppear{
                    appear = true
                }
                .onDisappear{
                    appear = false
                }
           
            Spacer()
        }.background(Color.white)
        
        .ignoresSafeArea()
    }
}

struct DetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        DetailView(namespace: namespace, appItem: AppItem(appClass: "Class1", title: "Title1", description: "Description1"))
    }
}
