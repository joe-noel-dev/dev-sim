//
//  UpdatePersonReducer.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

func updatePersonReducer(state: AppState, action: UpdatePersonAction) -> AppState {
    state.game.updatePerson(action.person)
    return state
}
