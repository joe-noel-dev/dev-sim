//
//  Game.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

class Game {
    var date = ISO8601DateFormatter().date(from: "2021-01-01T10:00:00+0000")!
    private(set) var people: [UUID: Person] = [:]
    private(set) var staffIds: [UUID] = []
    private(set) var transactions: [Transaction] = []

    var staff: [Person] {
        staffIds.filter { people[$0] != nil }.map { people[$0]! }
    }

    var balance: Currency {
        transactions.reduce(0, { total, transaction in total + transaction.amount })
    }

    func nextDay() {
        let secondsInADay = 24.0 * 60.0 * 60.0
        self.date += secondsInADay
    }

    func addTransaction(_ transaction: Transaction) {
        self.transactions.append(transaction)
    }

    func addPerson(_ person: Person) {
        self.people[person.id] = person
    }

    func updatePerson(_ person: Person) {
        guard people[person.id] != nil else {
            return
        }

        people[person.id] = person

    }

    func addStaffMember(_ id: UUID) {
        assert(self.people[id] != nil)
        self.staffIds.append(id)
    }

    func shouldProcessSalaries() -> Bool {
        Calendar(identifier: .gregorian).component(.weekday, from: date) == 2
    }

    func processSalaries() {
        guard shouldProcessSalaries() else {
            return
        }

        let wageBill = staff.filter({ person in person.weeklySalary != nil }).reduce(
            0, { value, person in value + person.weeklySalary! })

        self.addTransaction(
            Transaction(
                type: .salary, timestamp: date, amount: -wageBill, description: "Weekly wage bill"))
    }

}
