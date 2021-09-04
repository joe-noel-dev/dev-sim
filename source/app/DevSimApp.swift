import SwiftUI

let store = Store(reducer: rootReducer, state: State(), middlewares: [GameTimer()])

@main
struct DevSimApp: App {

    init() {
        store.dispatch(NewGameAction())
    }

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
