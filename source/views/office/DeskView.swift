//
//  DeskView.swift
//  DevSim
//
//  Created by Joe Noel on 04/09/2021.
//

import SwiftUI

struct DeskView: View {

    var body: some View {
        Rectangle()
            .fill(deskGradient())
            .cornerRadius(5.0)
    }

    private func deskGradient() -> LinearGradient {
        let deskStartColour: Color = Color(
            red: 0x73 / 255.0, green: 0x50 / 255.0, blue: 0x30 / 255.0)
        let deskEndColour: Color = Color(
            red: 0x49 / 255.0, green: 0x28 / 255.0, blue: 0x09 / 255.0)

        return LinearGradient(
            gradient: Gradient(colors: [deskStartColour, deskEndColour]),
            startPoint: .topLeading, endPoint: .bottom)
    }
}

struct DeskView_Previews: PreviewProvider {
    static var previews: some View {
        DeskView().frame(width: 48 * 8, height: 48 * 4)
    }
}
