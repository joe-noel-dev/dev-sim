import SwiftUI

let store = Store(reducer: rootReducer)

@main
struct DevSimApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
