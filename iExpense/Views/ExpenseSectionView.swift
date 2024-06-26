//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Justin Hold on 9/5/22.
//

import SwiftUI

struct ExpenseSection: View {
	
	// MARK: - PROPERTIES
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
	
	// MARK: - VIEW BODY
    var body: some View {
        Section(title) {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    Spacer()
                    Text(item.amount, format: .localCurrency)
                        .style(for: item)
                }
                .accessibilityElement()
                .accessibilityLabel("\(item.name), \(item.amount.formatted(.localCurrency))")
                .accessibilityHint(item.type)
            }
            .onDelete(perform: deleteItems)
        }
    }
}

struct ExpenseSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSection(title: "Example", expenses: []) { _ in }
    }
}
