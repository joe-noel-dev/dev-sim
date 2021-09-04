//
//  FloatingButton.swift
//  DevSim
//
//  Created by Joe Noel on 31/08/2021.
//

import SwiftUI

struct FloatingButton<Content: View>: View {

    let content: () -> Content

    init(_ content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        content()
            .padding(displayUnits(2))
            .frame(height: displayUnits(6))
            .background(
                Color("FloatingButtonBackground")
            )
            .cornerRadius(displayUnits(0.5))
            .shadow(radius: 2)
    }

}
