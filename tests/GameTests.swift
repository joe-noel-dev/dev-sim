//
//  GameTests.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import XCTest

@testable import DevSim

class GameTests: XCTestCase {

    func testBalanceIsSumOfTransactions() {
        let game = Game()
        game.addTransaction(
            Transaction(type: .loan, timestamp: Date(), amount: 1000, description: ""))
        game.addTransaction(
            Transaction(type: .salary, timestamp: Date(), amount: -30, description: ""))
        game.addTransaction(
            Transaction(type: .salary, timestamp: Date(), amount: -50, description: ""))
        game.addTransaction(
            Transaction(type: .salary, timestamp: Date(), amount: -100, description: ""))
        XCTAssertEqual(game.balance, 820)
    }
}
