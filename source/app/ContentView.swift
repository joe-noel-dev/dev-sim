import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: Store

    func date() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return "\(formatter.string(from: store.state.game.date))"
    }

    var body: some View {
        VStack {
            Text(date())
                .padding()
            Button(action: {
                store.dispatch(action: IncrementDayAction())
            }) {
                Text("Increment")
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(store)
    }
}
