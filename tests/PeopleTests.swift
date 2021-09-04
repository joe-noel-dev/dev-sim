//
//  PeopleTests.swift
//  DevSimTests
//
//  Created by Joe Noel on 30/08/2021.
//

import XCTest

@testable import DevSim

class PeopleTests: XCTestCase {

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
        store = Store(reducer: rootReducer, state: AppState(), middlewares: [])
        dispatchAndWait(action: NewGameAction())
    }

    override func tearDownWithError() throws {
        store = nil
    }

    func testDefaultGameHasProductOwnerAndDeveloper() throws {
        let staff = store!.state.game.staff
        XCTAssertGreaterThanOrEqual(
            staff.filter { person in person.role == .productOwner }.count, 1)
        XCTAssertGreaterThanOrEqual(staff.filter { person in person.role == .developer }.count, 1)
    }

}
