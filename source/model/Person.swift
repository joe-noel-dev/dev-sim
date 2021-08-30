//
//  Person.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

enum PersonRole {
    case productOwner
    case developer
}

struct Person {
    let id: UUID = UUID()
    let role: PersonRole

    init(withRole: PersonRole) {
        self.role = withRole
    }
}
