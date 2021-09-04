//
//  PersonListEntryView.swift
//  DevSim
//
//  Created by Joe Noel on 04/09/2021.
//

import SwiftUI

struct PersonListEntryView: View {
    let person: Person

    var body: some View {
        HStack(spacing: displayUnits(2)) {
            Circle().fill(Color.red)
                .frame(width: displayUnits(6), height: displayUnits(6))
                
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text(person.fullName).lineLimit(1)
                    
                    Text("\(person.role.description)")
                    .font (.subheadline)
                    .foregroundColor(.gray)
                }
            
                
                
            }
            Spacer()
            
        }.padding(displayUnits(2))
        
    }
}

struct PersonListEntryView_Previews: PreviewProvider {

    static var previews: some View {
        PersonListEntryView(person: Person(role: .developer))
            .previewLayout(.fixed(width: 320.0, height: 100.0))
    }
}
