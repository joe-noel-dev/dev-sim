//
//  RootReducer.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

func incrementDayReducer(state: State, action: IncrementDayAction) -> State {
    var state = state

    for _ in 0..<action.numDays {
        state.game.nextDay()
    }

    return state
}

func rootReducer(state: State, action: Action) -> State {
    var state = state

    switch action {
    case let incrementDayAction as IncrementDayAction:
        state = incrementDayReducer(state: state, action: incrementDayAction)
    default:
        break
    }

    return state
}
