//
//  IncrementDayReducer.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

func incrementDayReducer(state: State, action: IncrementDayAction) -> State {
    for _ in 0..<action.numDays {
        state.game.nextDay()
        state.game.processSalaries()
    }

    return state
}
