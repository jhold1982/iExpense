//
//  Example4.swift
//  iExpense
//
//  Created by Justin Hold on 3/14/23.
//

import SwiftUI

struct Example4: View {
	@State private var numbers = [Int]()
	@State private var currentNumber = 1
    var body: some View {
		NavigationStack {
			VStack {
				List {
					ForEach(numbers, id: \.self) {
						Text("Row \($0)")
					}
					.onDelete(perform: removeRows)
				}
				Button("Add Number") {
					numbers.append(currentNumber)
					currentNumber += 1
				}
				.buttonStyle(.borderedProminent)
				.clipShape(RoundedRectangle(cornerRadius: 15))
			}
			.navigationTitle("onDelete()")
			.toolbar {
				EditButton()
					.padding()
			}
		}
    }
	func removeRows(at offsets: IndexSet) {
		numbers.remove(atOffsets: offsets)
	}
}

struct Example4_Previews: PreviewProvider {
    static var previews: some View {
        Example4()
    }
}
