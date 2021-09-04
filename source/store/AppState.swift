//
//  State.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

struct AppState {
    var game = Game()
    var timer: Timer? = nil

    var timerRunning: Bool {
        timer != nil
    }
}
