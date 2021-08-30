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

    override func setUpWithError() throws {
        store = Store(reducer: rootReducer)
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
