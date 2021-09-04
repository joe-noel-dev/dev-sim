//
//  PersonRole.swift
//  DevSim
//
//  Created by Joe Noel on 04/09/2021.
//

import Foundation

enum PersonRole {
    case productOwner
    case developer

    var description: String {
        switch self {
        case .productOwner: return "Product Owner"
        case .developer: return "Developer"
        }
    }
}
