//
//  FloatingButton.swift
//  DevSim
//
//  Created by Joe Noel on 31/08/2021.
//

import SwiftUI

struct FloatingButton: View {

    let name: String

    var body: some View {
        Button {
            print("Clicked \(name)")
        } label: {

            Text(name)
                .padding()
                .background(Circle().fill(Color("Secondary")))
                .foregroundColor(Color("TextOnSecondary"))
                .shadow(radius: 2)
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton(name: "P").previewLayout(.sizeThatFits)
    }
}
