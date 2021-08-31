//
//  DateView.swift
//  DevSim
//
//  Created by Joe Noel on 31/08/2021.
//

import SwiftUI

struct DateView: View {
    let date: Date
    let nextDay: () -> Void

    init(date: Date, nextDay: @escaping () -> Void) {
        self.date = date
        self.nextDay = nextDay
    }

    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: self.date)
    }

    var body: some View {
        Button {
            nextDay()
        } label: {
            Text(formattedDate())
                .padding()

        }

    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(date: Date()) { print("Pressed") }.previewLayout(.sizeThatFits)
    }
}
