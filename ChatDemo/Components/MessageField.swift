//
//  MessageField.swift
//  ChatDemo
//
//  Created by Juan Hernandez Pazos on 24/05/22.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messageManager: MessagesManager
    @State private var message = ""
    @State private var showAlert = false
    @FocusState private var messageIsFocused: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "camera.fill")
                .imageScale(.large)
                .foregroundColor(.blue)
                .padding(8)
            
            Image(systemName: "mic.fill")
                .imageScale(.large)
                .foregroundColor(.blue)
                .padding(8)
            
            CustomTextField(placeholder: Text("Ingrese su mensaje"), text: $message)
                .focused($messageIsFocused)
            
            Button {
                if message.isEmpty {
                    showAlert.toggle()
                } else {
                    messageManager.sendMessage(text: message)
                    message = ""
                    messageIsFocused = false
                }
            } label: {
                Image(systemName: "arrow.up.circle.fill")
                    .imageScale(.large)
                    .foregroundColor(.blue)
                    .padding(8)
                    .alert(isPresented: $showAlert, content: {
                       Alert(title: Text("Ingrese su mensaje"))
                    })
            }
        } // HStack
        .padding(.vertical, 10)
        .background(.bar)
        .cornerRadius(20)
        .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
            .environmentObject(MessagesManager())
    }
}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        } //ZStack
    }
}
