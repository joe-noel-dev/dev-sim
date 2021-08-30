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
    var salary: Currency? = 10

    init(role: PersonRole) {
        self.role = role
    }
}
