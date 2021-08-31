//
//  TimerReducer.swift
//  DevSim
//
//  Created by Joe Noel on 31/08/2021.
//

import Foundation

func startTimer(state: State, action: StartTimerAction) -> State {
    var state = state

    if state.timer == nil {
        state.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            action.action()
        }
    }

    return state
}

func stopTimer(state: State) -> State {
    var state = state

    if let timer = state.timer {
        timer.invalidate()
        state.timer = nil
    }

    return state
}
