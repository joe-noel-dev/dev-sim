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
    
    var description: String {
        switch self {
            case .productOwner: return "Product Owner"
            case .developer: return "Developer"
        }
    }
}

struct Person {
    let id: UUID = UUID()
    let role: PersonRole
    let name: Name
    var weeklySalary: Currency? = 10

    var fullName: String {
        name.full
    }

    init(role: PersonRole) {
        self.role = role
        self.name = Name.generate()
    }

    static func generate(numPeople: Int, withRole: PersonRole) -> [Person] {
        (0..<numPeople).map({ _ in .init(role: withRole) })
    }
}
