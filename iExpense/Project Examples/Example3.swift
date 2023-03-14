//
//  Example3.swift
//  iExpense
//
//  Created by Justin Hold on 3/14/23.
//

// MARK: Showing and hiding views

import SwiftUI

struct SecondView: View {
	// @Environment allows us to create properties that store values
	// provided to us externally
	@Environment(\.dismiss) var dismiss
	let name: String
	var body: some View {
		Text("Hello, \(name)")
		Button("Dismiss") {
			dismiss()
		}
	}
}

struct Example3: View {
	// state needed to determine if sheet is showing or not
	@State private var sheetIsShowing = false
    var body: some View {
		Button("Show the sheet") {
			sheetIsShowing.toggle()
		}
		.sheet(isPresented: $sheetIsShowing) {
			SecondView(name: "@leftHandedApps!")
		}
    }
}

struct Example3_Previews: PreviewProvider {
    static var previews: some View {
        Example3()
    }
}
