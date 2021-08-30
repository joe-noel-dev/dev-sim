//
//  RootReducer.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

func nextDayReducer(state: State, action: Action) -> State {
    var state = state
    state.game.date += 24 * 60 * 60
    return state
}

func rootReducer(state: State, action: Action) -> State {
    var state = state

    switch action {
    case _ as NextDayAction:
        state = nextDayReducer(state: state, action: action)
    default:
        break
    }

    return state
}
