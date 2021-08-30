//
//  UpdatePersonReducer.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

func updatePersonReducer(state: State, action: UpdatePersonAction) -> State {
    state.game.updatePerson(action.person)
    return state
}
