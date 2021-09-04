//
//  PersonActions.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

struct UpdatePersonAction: Action {
    let person: Person
}

struct HirePersonAction: Action {
    let person: Person
}
