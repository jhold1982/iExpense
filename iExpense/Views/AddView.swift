//
//  AddView.swift
//  iExpense
//
//  Created by Justin Hold on 9/5/22.
//

import SwiftUI

struct AddView: View {
	
	// MARK: - PROPERTIES
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
	
    let types = ["Business", "Personal"]
	
	// MARK: - VIEW BODY
    var body: some View {
        NavigationView {
            Form {
				
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
				
                TextField("Amount", value: $amount, format: .localCurrency)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add New Expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(
						name: name,
						type: type,
						amount: amount
					)
                    expenses.items.append(item)
                    dismiss()
                }
				.padding()
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
		// expenses is a new Expenses Object "Dummy Value"
        AddView(expenses: Expenses())
    }
}
