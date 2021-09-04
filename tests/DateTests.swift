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

    func dispatchAndWait(action: Action) {
        let dispatchExpectation = self.expectation(description: "Dispatch action")

        store!.dispatch(action)

        DispatchQueue.main.async {
            dispatchExpectation.fulfill()
        }

        wait(for: [dispatchExpectation], timeout: 5.0)
    }

    override func setUpWithError() throws {
        store = Store(reducer: rootReducer, state: State(), middlewares: [])
        dispatchAndWait(action: NewGameAction())
    }

    override func tearDownWithError() throws {
        store = nil
    }

    func increment(numDays: Int) {
        dispatchAndWait(action: IncrementDayAction(numDays: numDays))

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
