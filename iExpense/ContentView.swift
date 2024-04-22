//
//  ContentView.swift
//  iExpense
//
//  Created by Justin Hold on 9/5/22.
//

import SwiftUI

struct ContentView: View {
	
	// MARK: - PROPERTIES
    @StateObject var expenses = Expenses()
	
	// MARK: - VIEW BODY
    var body: some View {
        NavigationView {
            List {
				
                ExpenseSection(
					title: "Business",
					expenses: expenses.businessItems,
					deleteItems: removeBusinessItems
				)
				
                ExpenseSection(
					title: "Personal",
					expenses: expenses.personalItems,
					deleteItems: removePersonalItems
				)
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddView(expenses: expenses)
                } label: {
                    Label("Add Expense", systemImage: "plus")
                }
				.padding()
            }
        }
    }
	
	// MARK: - FUNCTIONS
	/// Method to delete items
	/// - Parameters:
	///   - offsets: finds item in array, removes from array, and sets correct positon of array items
	///   - inputArray: calls to the array of ExpenseItems
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        for offset in offsets {
            let item = inputArray[offset]
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        expenses.items.remove(atOffsets: objectsToDelete)
    }
	
	/// Method to remove items from Personal
	/// - Parameter offsets: finds item in array, removes from array, and sets correct positon of array items
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
	
	/// Method to remove items from Personal
	/// - Parameter offsets: finds item in array, removes from array, and sets correct positon of array items
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
