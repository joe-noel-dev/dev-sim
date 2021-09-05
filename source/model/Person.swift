//
//  Person.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation
import GameplayKit

struct Person {
    let id: UUID = UUID()
    let role: PersonRole
    let name: Name

    let colours: PersonColours

    let salaryExpectationScalar = Double(random(lowest: 60, highest: 140)) / 100.0

    let experience = Double(random(lowest: 10, highest: 90)) / 100.0
    let speed = Double(random(lowest: 10, highest: 90)) / 100.0
    let productKnowledge = Double(random(lowest: 0, highest: 20)) / 100.0

    var salaryExpectation: Currency {
        let baseline = 50.0
        let experienceContribution = 50.0 * experience
        let speedContribution = 30.0 * speed
        let productKnowledgeContribution = 30.0 * productKnowledge
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
        self.colours = PersonColours.random()
    }

    static func generate(numPeople: Int, withRole: PersonRole) -> [Person] {
        (0..<numPeople).map({ _ in .init(role: withRole) })
    }

    static func random(lowest: Int, highest: Int) -> Int {
        let random = GKRandomSource()
        let distribution = GKGaussianDistribution(
            randomSource: random, lowestValue: lowest, highestValue: highest)
        return distribution.nextInt()
    }
}
