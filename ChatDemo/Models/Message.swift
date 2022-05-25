//
//  Message.swift
//  ChatDemo
//
//  Created by Juan Hernandez Pazos on 24/05/22.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
