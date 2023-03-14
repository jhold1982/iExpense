//
//  ExenseItems.swift
//  iExpense
//
//  Created by Justin Hold on 9/5/22.
//

import Foundation

// adding Identifiable, this type can be identified uniquely, must contain one ID property UUID()
// ExpenseItems now guaranteed to be unique
struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
