//
//  MessageBubble.swift
//  ChatDemo
//
//  Created by Juan Hernandez Pazos on 24/05/22.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ? Color("Gray") : Color("LightBlue"))
                    .cornerRadius(20)
            } // HStack
            .frame(maxWidth: 350, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.year().month().day().hour().minute()))")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }
            
        } // VStack
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(
                      id: "12345",
                      text: "Preparando una nueva interfaz para el app CypherTop",
                      received: true,
                      timestamp: Date()))
        
        
    }
}
