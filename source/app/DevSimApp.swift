import SwiftUI

let store = Store(reducer: rootReducer)

@main
struct DevSimApp: App {

    init() {
        store.dispatch(action: NewGameAction())
    }

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
