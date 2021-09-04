//
//  TimerReducer.swift
//  DevSim
//
//  Created by Joe Noel on 31/08/2021.
//

import Foundation

class GameTimer: Middleware {
    private var timer: Timer? = nil

    func execute(state: State, action: Action, dispatch: @escaping (Action) -> Void) {
        switch action {
        case _ as StartTimerAction:

            if timer == nil {
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                    dispatch(IncrementDayAction())
                }

                dispatch(TimerStartedAction())
            }

        case _ as StopTimerAction:
            if timer != nil {
                timer?.invalidate()
                timer = nil

                dispatch(TimerStoppedAction())
            }

        default:
            break
        }
    }
}
