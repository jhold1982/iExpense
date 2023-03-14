//
//  Example5.swift
//  iExpense
//
//  Created by Justin Hold on 3/14/23.
//

import SwiftUI

// MARK: Storing user settings with UserDefaults

struct Example5: View {
	@State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    var body: some View {
		Button("Tap Count: \(tapCount)") {
			tapCount += 1
			UserDefaults.standard.set(tapCount, forKey: "Tap")
		}
    }
}

struct Example5_Previews: PreviewProvider {
    static var previews: some View {
        Example5()
    }
}
