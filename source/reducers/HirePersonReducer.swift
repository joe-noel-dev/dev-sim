//
//  HirePersonReducer.swift
//  DevSim
//
//  Created by Joe Noel on 04/09/2021.
//

import Foundation

func hirePersonReducer(state: AppState, action: HirePersonAction) -> AppState {
    state.game.addStaffMember(action.person.id)
    return state
}
