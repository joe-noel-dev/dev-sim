//
//  GameView.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import SwiftUI

struct GameView: View {

    @EnvironmentObject var store: Store

    @State private var peopleSheet = false

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
                actionIcons()
                Spacer()
                moneyIcons()
            }
            .padding([.leading])
            Spacer()
        }.padding(displayUnits(2))
    }

    private func rightChannel() -> some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing, spacing: displayUnits(2)) {
                calendarButton()
                Spacer()
                statusIcons()
            }
        }.padding(displayUnits(2))
    }

    private func calendarButton() -> some View {
        FloatingButton {
            HStack(spacing: displayUnits(1)) {
                Image("Calendar")
                DateView(date: store.state.game.date)
                store.state.timerRunning ? Image("Pause") : Image("Play")

            }.onTapGesture {
                onPressDate()
            }
        }
    }

    private func statusIcons() -> some View {
        let statusIcons = [
            ("Customers", "0"),
            ("Bugs", "0"),
            ("Features", "0"),
            ("Quality", "100%"),
        ]

        return ForEach(statusIcons, id: \.0) { (iconName, value) in
            FloatingButton {
                HStack(spacing: displayUnits(1)) {
                    Image(iconName)
                    Text(value)
                }
            }
        }
    }

    private func moneyIcons() -> some View {
        let topIcons = [
            ("Money", "\(store.state.game.balance)"),
            ("Price", "10"),
        ]

        return ForEach(topIcons, id: \.0) { (iconName, value) in
            FloatingButton {
                HStack(spacing: displayUnits(1)) {
                    Image(iconName)
                    Text(value)
                }
            }

        }
    }

    private func actionIcons() -> some View {
        Group {
            FloatingButton {
                Image("Policy")
            }
            FloatingButton {
                Image("Mail")
            }

            Button {
                peopleSheet.toggle()
            } label: {
                FloatingButton {
                    Image("People")
                }.sheet(isPresented: $peopleSheet) {
                    PeopleSheet()
                }
            }
        }

    }

    private func onPressDate() {
        store.dispatch(store.state.timerRunning ? StopTimerAction() : StartTimerAction())
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {

        Group {
            ZStack {
                Color("AppBackground").ignoresSafeArea()
                GameView().environmentObject(store)
            }
        }

        Group {
            ZStack {
                Color("AppBackground").ignoresSafeArea()
                GameView().environmentObject(store)
            }
        }
        .previewDevice("iPad Air (4th generation)")
    }
}
