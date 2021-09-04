//
//  RootReducer.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

func rootReducer(state: State, action: Action) -> State {
    var state = state

    switch action {
    case let incrementDayAction as IncrementDayAction:
        state = incrementDayReducer(state: state, action: incrementDayAction)
    case _ as NewGameAction:
        state = newGameReducer(state: state)
    case let updatePersonAction as UpdatePersonAction:
        state = updatePersonReducer(state: state, action: updatePersonAction)
    case _ as TimerStartedAction:
        state.timerRunning = true
    case _ as TimerStoppedAction:
        state.timerRunning = false
    default:
        break
    }

    return state
}
