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
            leftChannelButtons()
            dateView()
        }
    }

    private func leftChannelButtons() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                BalanceView(balance: store.state.game.balance)
                FloatingButton(name: "📜")
                FloatingButton(name: "🗞")
                FloatingButton(name: "👨‍👩‍👧‍👦")
                Spacer()
            }
            .padding([.leading])
            Spacer()
        }
    }

    private func dateView() -> some View {
        HStack {
            Spacer()
            VStack(alignment: .leading) {
                DateView(date: store.state.game.date).onTapGesture {
                    onPressDate()
                }
                Spacer()
            }
            Spacer()
        }
    }

    private func onPressDate() {
        if store.state.timer == nil {
            store.dispatch(
                action: StartTimerAction(action: { store.dispatch(action: IncrementDayAction()) }))
        } else {
            store.dispatch(action: StopTimerAction())
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("AppBackground").ignoresSafeArea()
            GameView().environmentObject(store)
        }
    }
}
