//
//  GameView.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import SwiftUI

struct GameView: View {

    @EnvironmentObject var store: Store

    var body: some View {

        ZStack {
            leftChannel()
            rightChannel()
            OfficeView()

        }.foregroundColor(.white)

    }

    private func leftChannel() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: displayUnits(2)) {
                Image("Policy").floatingButton()
                Image("Mail").floatingButton()
                Image("People").floatingButton()
                Spacer()
                HStack(spacing: displayUnits(1)) {
                    Image("Calendar")
                    DateView(date: store.state.game.date)
                    store.state.timerRunning ? Image("Pause") : Image("Play")

                }.floatingButton()
                    .onTapGesture {
                        onPressDate()
                    }
            }
            .padding([.leading])
            Spacer()
        }.padding(16.0)
    }

    private func rightChannel() -> some View {
        typealias IconValue = (String, String)
        let topIcons = [
            ("Money", "\(store.state.game.balance)"),
            ("Price", "10"),
        ]

        let bottomIcons = [
            ("Customers", "0"),
            ("Bugs", "0"),
            ("Features", "0"),
            ("Quality", "100%"),
        ]

        return HStack {
            Spacer()
            VStack(alignment: .trailing, spacing: 16) {
                ForEach(topIcons, id: \.0) { (iconName, value) in
                    HStack(spacing: displayUnits(1)) {
                        Image(iconName)
                        Text(value)
                    }.floatingButton()
                }

                Spacer()

                ForEach(bottomIcons, id: \.0) { (iconName, value) in
                    HStack(spacing: displayUnits(1)) {
                        Image(iconName)
                        Text(value)
                    }.floatingButton()
                }
            }
        }.padding(16.0)
    }

    private func onPressDate() {
        store.dispatch(store.state.timerRunning ? StopTimerAction() : StartTimerAction())
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("AppBackground").ignoresSafeArea()
            GameView().environmentObject(store)
        }.previewLayout(.fixed(width: 2532 / 3.0, height: 1170 / 3.0))
            .environment(\.horizontalSizeClass, .regular)
            .environment(\.verticalSizeClass, .compact)
    }
}
