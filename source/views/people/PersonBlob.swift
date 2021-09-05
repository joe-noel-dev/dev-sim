//
//  PersonBlob.swift
//  DevSim
//
//  Created by Joe Noel on 04/09/2021.
//

import SwiftUI

extension Color {
    init(personColour: PersonColour) {
        let r = (personColour.rawValue & 0xFF00_0000) >> 24
        let g = (personColour.rawValue & 0x00FF_0000) >> 16
        let b = (personColour.rawValue & 0x0000_FF00) >> 8
        let a = (personColour.rawValue & 0x0000_00FF)
        self.init(
            .sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255,
            opacity: Double(a) / 255)
    }
}

struct PersonBlob: View {
    let colours: PersonColours

    var body: some View {
        ZStack {

            background()
            gradient()
            personBody().clipShape(Circle().inset(by: 2.0))
            personHead()
        }
    }
    
    func personHead() -> some View {
        GeometryReader { metrics in

            Circle().fill(Color(personColour: colours.head))
                .frame(
                    width: 0.4 * metrics.size.width, height: 0.4 * metrics.size.height,
                    alignment: .center)
                    .position(x: 0.5 * metrics.size.width, y: 0.4 * metrics.size.height)

        }
    }

    func personBody() -> some View {

        GeometryReader { metrics in

            Circle().fill(Color(personColour: colours.body))
                .frame(
                    width: 0.8 * metrics.size.width, height: 0.8 * metrics.size.height,
                    alignment: .center)
                    .position(x: 0.5 * metrics.size.width, y: 0.9 * metrics.size.height)

        }

    }

    func background() -> some View {
        Circle()
            .strokeBorder(Color(personColour: colours.border), lineWidth: 2.0)
            .background(Circle().foregroundColor(Color(personColour: colours.background).opacity(0.7)))
                        
    }

    func gradient() -> some View {
        Circle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.white.opacity(0.3), .white.opacity(0.0)]),
                    startPoint: .topLeading, endPoint: .bottomTrailing)
            )
    }
}

struct PersonBlob_Previews: PreviewProvider {
    static var previews: some View {
        PersonBlob(colours: PersonColours.random()).previewLayout(
            .fixed(width: 200.0, height: 200.0))
    }
}
