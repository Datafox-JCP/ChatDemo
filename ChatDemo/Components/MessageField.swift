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
    
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("Ingrese su mensaje"), text: $message)
            
            Button {
                messageManager.sendMessage(text: message)
                message = ""
            } label: {
                Image(systemName: "arrow.up.circle.fill")
                    .font(.title2)
                    .padding(10)
            }
        } // HStack
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Gray"))
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
