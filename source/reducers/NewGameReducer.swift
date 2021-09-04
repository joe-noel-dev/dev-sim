//
//  NewGameReducer.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

func newGameReducer(state: AppState) -> AppState {
    var state = state
    let game = Game()

    let developer = Person(role: .developer)
    game.addPerson(developer)
    game.addStaffMember(developer.id)

    let po = Person(role: .productOwner)
    game.addPerson(po)
    game.addStaffMember(po.id)

    game.addTransaction(
        Transaction(type: .loan, timestamp: game.date, amount: 10000, description: "Bank loan"))

    state.game = game
    return state
}
