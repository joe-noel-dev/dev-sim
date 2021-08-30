//
//  Game.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

struct Game {
    var date = Date()
    var people: [UUID: Person] = [:]
    var staffIds: [UUID]

    init() {
        let developer = Person(withRole: .developer)
        let po = Person(withRole: .productOwner)
        self.people = [developer.id: developer, po.id: po]
        self.staffIds = [developer.id, po.id]
    }

    var staff: [Person] {
        staffIds.filter { people[$0] != nil }.map { people[$0]! }
    }

    mutating func nextDay() {
        let secondsInADay = 24.0 * 60.0 * 60.0
        self.date += secondsInADay
    }

}
