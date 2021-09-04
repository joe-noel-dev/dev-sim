//
//  PeopleSheet.swift
//  DevSim
//
//  Created by Joe Noel on 04/09/2021.
//

import SwiftUI

struct PeopleSheet: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: Store

    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack (alignment: .trailing) {
                    Button(action: {presentationMode.wrappedValue.dismiss()}) {
                            Image("Cross").padding()
                    }
                    
                }
            }
            
            

            ScrollView {
                ForEach(Array(store.state.game.people.keys), id: \.self) { id in
                    Text(store.state.game.people[id]!.fullName)
                        .padding()
                }
            }

        }.background(Color("ModalBackground"))
        .foregroundColor(.white).edgesIgnoringSafeArea(.all)

    }
}

struct PeopleSheet_Previews: PreviewProvider {
    static var previews: some View {
        PeopleSheet().environmentObject(store)
    }
}
