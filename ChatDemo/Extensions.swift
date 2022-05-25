//
//  Extensions.swift
//  ChatDemo
//
//  Created by Juan Hernandez Pazos on 24/05/22.
//

import Foundation
import SwiftUI

// Extensión para añadir esquinas redondeadas a esquinas específicas
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

// Shape RoundedCorner personalizada usada por la extensión cornerRadius
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
