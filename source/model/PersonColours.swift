//
//  PersonColour.swift
//  DevSim
//
//  Created by Joe Noel on 05/09/2021.
//

import Foundation

enum PersonColour: UInt64 {
    case red = 0xFF45_45FF
    case orange = 0xFF9E_45FF
    case yellow = 0xFFEC_45FF
    case green = 0x63D4_60FF
    case turquoise = 0x00D6_C9FF
    case blue = 0x003C_D6FF
    case fuschia = 0x8500_D6FF
    case pink = 0xD600_81FF
}

struct PersonColours {

    static let values: [PersonColour] = [
        .red,
        .orange,
        .yellow,
        .green,
        .turquoise,
        .blue,
        .fuschia,
        .pink,
    ]

    let border: PersonColour
    let background: PersonColour
    let body: PersonColour
    let head: PersonColour

    static func random() -> PersonColours {
        var values = values
        values.shuffle()
        return .init(border: values[0], background: values[1], body: values[2], head: values[3])
    }

}
