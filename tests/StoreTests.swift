//
//  TimeActions.swift
//  DevSimTests
//
//  Created by Joe Noel on 30/08/2021.
//

import XCTest

@testable import DevSim

class StoreTests: XCTestCase {

    var store: Store? = nil

    override func setUpWithError() throws {
        store = Store(reducer: rootReducer)
    }

    override func tearDownWithError() throws {
        store = nil
    }

    func testIncrementTime() throws {
        let dateBefore = store!.state.game.date
        var dateAfter = dateBefore

        let nextDayExpectation = self.expectation(description: "Next Day")

        store!.dispatch(action: NextDayAction())

        DispatchQueue.main.async {
            dateAfter = self.store!.state.game.date
            nextDayExpectation.fulfill()
        }

        waitForExpectations(timeout: 5.0, handler: nil)

        XCTAssertNotEqual(dateBefore, dateAfter)
        XCTAssertEqual(24 * 60 * 60, DateInterval(start: dateBefore, end: dateAfter).duration)

    }

}
