//
//  Middleware.swift
//  DevSim
//
//  Created by Joe Noel on 04/09/2021.
//

import Foundation

protocol Middleware {
    mutating func execute(state: State, action: Action, dispatch: @escaping (Action) -> Void)
}
