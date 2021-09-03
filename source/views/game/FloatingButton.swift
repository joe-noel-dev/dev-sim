//
//  FloatingButton.swift
//  DevSim
//
//  Created by Joe Noel on 31/08/2021.
//

import SwiftUI

struct FloatingButton: ViewModifier {

    func body(content: Content) -> some View {
        content
            .padding(displayUnits(2))
            .frame(height: displayUnits(6))
            .background(
                Color("FloatingButtonBackground")
            )
            .cornerRadius(displayUnits(0.5))
            .shadow(radius: 2)

    }
}

extension View {
    func floatingButton() -> some View {
        self.modifier(FloatingButton())
    }
}
