//
//  ContentView.swift
//  iExpense
//
//  Created by Justin Hold on 9/5/22.
//

import SwiftUI

struct ContentView: View {
	// asks SwiftUI to watch the object for any change announcements
	// if any of those properties change, the view will refresh the body
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
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
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
				.padding()
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
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
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
