//
//  TitleRow.swift
//  ChatDemo
//
//  Created by Juan Hernandez Pazos on 24/05/22.
//

import SwiftUI

struct TitleRow: View {
    @State private var showMenu = false
    
    var imageUrl = URL(string: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3000")
    var name = "Jorge Alonso Macias"
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
                
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title2)
                    .bold()
                
                Text("Online")
                    .font(.caption2)
                    .foregroundColor(.white)
                
            } // VStack
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "info.circle.fill")
                .font(.title2)
                .foregroundColor(.blue)
                .padding(10)
                .onTapGesture {
                    showMenu = true
                }
            
        } // HStack
        .padding()
        .actionSheet(isPresented: $showMenu) {
            ActionSheet(title: Text("Opciones"),
                        buttons:
                            [.default(Text("Ver contacto"), action: {
                                // Código para ver el contacto
                            }),
                             .default(Text("Bloquear"), action: {
                                 // Código para bloquear
                             }),
                             .default(Text("Ver archivos"), action: {
                                 // Código para bloquear
                             }),
                             .destructive(Text("Borrar mensajes"), action: {
                                 // Código para bloquear
                             }),
                             .destructive(Text("Borrar contacto"), action: {
                                 // Código para bloquear
                             }),
                             .cancel()
                            ])
            }
        }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color("LightBlue"))
    }
}
