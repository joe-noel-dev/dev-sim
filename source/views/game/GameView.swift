//
//  GameView.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import SwiftUI

struct GameView: View {

    @EnvironmentObject var store: Store

    func leftChannelButtons() -> some View {
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

    func dateView() -> some View {
        HStack {
            Spacer()
            VStack(alignment: .leading) {
                DateView(date: store.state.game.date) {
                    store.dispatch(action: IncrementDayAction())
                }
                Spacer()
            }
            Spacer()
        }
    }

    var body: some View {
        ZStack {
            leftChannelButtons()
            dateView()
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
