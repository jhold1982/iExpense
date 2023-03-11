//
//  ExenseItems.swift
//  iExpense
//
//  Created by Justin Hold on 9/5/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
