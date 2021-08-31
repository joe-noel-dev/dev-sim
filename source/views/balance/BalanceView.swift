//
//  BalanceView.swift
//  DevSim
//
//  Created by Joe Noel on 31/08/2021.
//

import SwiftUI

struct BalanceView: View {
    let balance: Currency
    
    var body: some View {
        Text("💰 \(balance)")
            .padding()
    }
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView(balance: 10000).previewLayout(.sizeThatFits)
    }
}
