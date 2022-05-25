//
//  ContentView.swift
//  ChatDemo
//
//  Created by Juan Hernandez Pazos on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
    
    var messageArray = ["Hola", "¿Cómo te va?", "Trabajando en el nuevo diseño de la interfaz de los mensajes en CypherTop"]
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    } // ScrollView
                    .padding(.top, 10)
                    .background(.white)
                .cornerRadius(30, corners: [.topRight, .topLeft])
                .onChange(of: messagesManager.lastMessageId) { id in
                    withAnimation {
                        proxy.scrollTo(id, anchor: .bottom)
                    }
                }
                } // ScrollViewReader
                
            } // VStack
            .background(Color("LightBlue"))
            
            MessageField()
                .environmentObject(messagesManager)
        } // VStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
