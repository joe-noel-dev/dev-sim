//
//  Person.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

struct Person {
    let id: UUID = UUID()
    let role: PersonRole
    let name: Name

    let salaryExpectationScalar = Double.random(in: 0.8...1.2)

    let experience = Double.random(in: 0...1)
    let speed = Double.random(in: 0...1)
    let productKnowledge = Double.random(in: 0...0.1)

    var salaryExpectation: Currency {
        let baseline = 50.0
        let experienceContribution = 20.0 * experience
        let speedContribution = 20.0 * speed
        let productKnowledgeContribution = 20.0 * productKnowledge
        let expectation =
            salaryExpectationScalar
            * (baseline + experienceContribution + speedContribution + productKnowledgeContribution)
        return Currency(floor(expectation))
    }

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
