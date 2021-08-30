//
//  PeopleTests.swift
//  DevSimTests
//
//  Created by Joe Noel on 30/08/2021.
//

import XCTest

@testable import DevSim

class TransactionTests: XCTestCase {

    var store: Store? = nil

    func dispatchAndWait(action: Action) {
        let dispatchExpectation = self.expectation(description: "Dispatch action")

        store!.dispatch(action: action)

        DispatchQueue.main.async {
            dispatchExpectation.fulfill()
        }

        wait(for: [dispatchExpectation], timeout: 5.0)
    }

    override func setUpWithError() throws {
        store = Store(reducer: rootReducer)
        dispatchAndWait(action: NewGameAction())
    }

    override func tearDownWithError() throws {
        store = nil
    }

    func dayOfWeek() -> Int {
        return Calendar(identifier: .gregorian).component(.weekday, from: store!.state.game.date)
    }

    func nextDay() {
        dispatchAndWait(action: IncrementDayAction())
    }

    func testSalariesAreProcessedOnAMonday() throws {

        let individualSalary = 50
        var totalSalary = 0

        let people = store!.state.game.staff
        for person in people {
            var person = person
            person.salary = individualSalary
            totalSalary += individualSalary
            dispatchAndWait(action: UpdatePersonAction(person: person))
        }

        while dayOfWeek() != 7 {
            nextDay()
        }

        let dayBefore = store!.state.game.date
        nextDay()

        let transactions = store!.state.game.transactions.filter { transaction in
            return transaction.timestamp > dayBefore && transaction.type == .salary
        }

        XCTAssertGreaterThanOrEqual(transactions.count, 1)
        XCTAssertEqual(transactions[0].amount, -totalSalary)
    }

}
