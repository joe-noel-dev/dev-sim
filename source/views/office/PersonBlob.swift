//
//  PersonBlob.swift
//  DevSim
//
//  Created by Joe Noel on 04/09/2021.
//

import SwiftUI

struct PersonBlob: View {
    var body: some View {
        Circle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.white.opacity(0.3), .white.opacity(0.0)]),
                    startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .background(Circle().fill(Color.blue))

    }
}

struct PersonBlob_Previews: PreviewProvider {
    static var previews: some View {
        PersonBlob().previewLayout(.fixed(width: 200.0, height: 200.0))
    }
}
