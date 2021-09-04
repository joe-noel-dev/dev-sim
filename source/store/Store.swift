//
//  File.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

class Store: ObservableObject {
    let reducer: Reducer
    @Published private(set) var state: State
    let middlewares: [Middleware]

    init(reducer: @escaping Reducer, state: State, middlewares: [Middleware]) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
    }

    func dispatch(_ action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }

        for var middleware in middlewares {
            middleware.execute(state: self.state, action: action) { action in
                self.dispatch(action)
            }
        }
    }
}
