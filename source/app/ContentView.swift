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
        ContentView().environmentObject(store).previewLayout(
            .fixed(width: 2532 / 3.0, height: 1170 / 3.0)
        )
        .environment(\.horizontalSizeClass, .regular)
        .environment(\.verticalSizeClass, .compact)
    }
}
