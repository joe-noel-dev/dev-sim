//
//  PersonListEntryView.swift
//  DevSim
//
//  Created by Joe Noel on 04/09/2021.
//

import SwiftUI

struct PersonListEntryView: View {
    let person: Person
    let employed: Bool

    @EnvironmentObject var store: Store

    var body: some View {
        HStack(spacing: displayUnits(2)) {
            Circle().fill(Color.red)
                .frame(width: displayUnits(6), height: displayUnits(6))

            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .bottom) {
                    Text(person.fullName).lineLimit(1)

                    Text("\(person.role.description)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                attributeBar(value: person.experience, colour: .blue)
                attributeBar(value: person.speed, colour: .green)
                attributeBar(value: person.productKnowledge, colour: .yellow)

                if !employed {
                    Button("Hire for \(person.salaryExpectation)") {
                        store.dispatch(HirePersonAction(person: person))
                    }
                }

            }
            .frame(maxWidth: .infinity)
            Spacer()

        }.padding(displayUnits(2))

    }

    private func attributeBar(value: Double, colour: Color) -> some View {
        GeometryReader { metrics in
            Rectangle().fill(colour)
                .frame(maxWidth: .infinity)
                .frame(width: metrics.size.width * CGFloat(value), height: 3)
                .cornerRadius(3)
                .padding([.top, .bottom], 2)
        }
    }
}

struct PersonListEntryView_Previews: PreviewProvider {

    static var previews: some View {
        PersonListEntryView(person: Person(role: .developer), employed: false)
            .previewLayout(.fixed(width: 320.0, height: 100.0))
    }
}
