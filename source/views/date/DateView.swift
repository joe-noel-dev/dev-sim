//
//  DateView.swift
//  DevSim
//
//  Created by Joe Noel on 31/08/2021.
//

import SwiftUI

struct DateView: View {
    let date: Date

    var body: some View {
        Text(formattedDate())
            .padding()
    }

    private func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: self.date)
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(date: Date()).previewLayout(.sizeThatFits)
    }
}
