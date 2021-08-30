//
//  Transaction.swift
//  DevSim
//
//  Created by Joe Noel on 30/08/2021.
//

import Foundation

enum TransactionType {
    case loan
    case salary
}

struct Transaction {
    let id = UUID()
    let type: TransactionType
    let timestamp: Date
    let amount: Currency
    let description: String
}
