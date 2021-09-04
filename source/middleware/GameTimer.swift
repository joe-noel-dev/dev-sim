//
//  TimerReducer.swift
//  DevSim
//
//  Created by Joe Noel on 31/08/2021.
//

import Foundation

class GameTimer: Middleware {

    func execute(state: AppState, action: Action, dispatch: @escaping (Action) -> Void) {
        switch action {
        case _ as StartTimerAction:

            guard !state.timerRunning else {
                return
            }

            let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                dispatch(IncrementDayAction())
            }

            dispatch(TimerStartedAction(timer: timer))

        case _ as StopTimerAction:
            guard state.timerRunning else {
                return
            }

            state.timer?.invalidate()
            dispatch(TimerStoppedAction())

        default:
            break
        }
    }
}
