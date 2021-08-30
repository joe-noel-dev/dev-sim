//
//  TimeActions.swift
//  DevSimTests
//
//  Created by Joe Noel on 30/08/2021.
//

import XCTest

@testable import DevSim

class DateTests: XCTestCase {

    var store: Store? = nil

    override func setUpWithError() throws {
        store = Store(reducer: rootReducer)
    }

    override func tearDownWithError() throws {
        store = nil
    }

    func increment(numDays: Int) {
        let incrementExpectation = self.expectation(description: "Increment date")

        store!.dispatch(action: IncrementDayAction(numDays: numDays))

        DispatchQueue.main.async {
            incrementExpectation.fulfill()
        }

        wait(for: [incrementExpectation], timeout: 5.0)

    }

    func testIncrementASingleDay() throws {
        let dateBefore = store!.state.game.date
        increment(numDays: 1)
        let dateAfter = store!.state.game.date
        XCTAssertNotEqual(dateBefore, dateAfter)
        XCTAssertEqual(
            24 * 60 * 60, DateInterval(start: dateBefore, end: dateAfter).duration, accuracy: 1e-3)
    }

    func testIncrementMultipleDays() throws {
        let dateBefore = store!.state.game.date
        let numDays = 5
        increment(numDays: numDays)
        let dateAfter = store!.state.game.date
        XCTAssertNotEqual(dateBefore, dateAfter)
        XCTAssertEqual(
            TimeInterval(numDays * 24 * 60 * 60),
            DateInterval(start: dateBefore, end: dateAfter).duration, accuracy: 1e-3)
    }

}
