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

    let peopleToGenerate = [
        (60, PersonRole.developer),
        (20, PersonRole.productOwner),
    ]

    peopleToGenerate.map({ count, role in Person.generate(numPeople: count, withRole: role) })
        .reduce([], { x, y in x + y })
        .forEach({ person in game.addPerson(person) })

    game.addTransaction(
        Transaction(type: .loan, timestamp: game.date, amount: 10000, description: "Bank loan"))

    state.game = game
    return state
}
