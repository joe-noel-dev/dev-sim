import SwiftUI

struct ContentView: View {

    var body: some View {
        ZStack {
            Color("AppBackground").ignoresSafeArea()
            GameView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(store)
    }
}
