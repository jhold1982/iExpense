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
    @State private var name = "New Expense"
    @State private var type = "Personal"
    @State private var amount = 0.0
	
    let types = ["Business", "Personal"]
	
	// MARK: - VIEW BODY
    var body: some View {
        
		Form {
			
			
			
			Picker("Type", selection: $type) {
				ForEach(types, id: \.self) {
					Text($0)
				}
			}
			
			TextField("Amount", value: $amount, format: .localCurrency)
				.keyboardType(.decimalPad)
		}
		.navigationTitle($name)
		.toolbar {
			
			ToolbarItem(placement: .confirmationAction) {
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
			
			ToolbarItem(placement: .cancellationAction) {
				Button("Cancel", role: .cancel) {
					dismiss()
				}
				.padding()
			}
		}
		.navigationBarBackButtonHidden()
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
		// expenses is a new Expenses Object "Dummy Value"
        AddView(expenses: Expenses())
    }
}
