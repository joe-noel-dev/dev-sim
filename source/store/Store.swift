//
//  File.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

class Store: ObservableObject {
    var reducer: Reducer
    @Published private(set) var state: State

    init(reducer: @escaping Reducer, state: State = State()) {
        self.reducer = reducer
        self.state = state
    }

    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
    }
}
