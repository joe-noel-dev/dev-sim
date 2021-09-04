//
//  RootReducer.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

func rootReducer(state: AppState, action: Action) -> AppState {
    var state = state

    switch action {
    case let incrementDayAction as IncrementDayAction:
        state = incrementDayReducer(state: state, action: incrementDayAction)
    case _ as NewGameAction:
        state = newGameReducer(state: state)
    case let updatePersonAction as UpdatePersonAction:
        state = updatePersonReducer(state: state, action: updatePersonAction)
    case let hirePersonAction as HirePersonAction:
        state = hirePersonReducer(state: state, action: hirePersonAction)
    case let timerStartedAction as TimerStartedAction:
        state.timer = timerStartedAction.timer
    case _ as TimerStoppedAction:
        state.timer = nil
    default:
        break
    }

    return state
}
