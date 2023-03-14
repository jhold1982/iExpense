//
//  Example6.swift
//  iExpense
//
//  Created by Justin Hold on 3/14/23.
//

import SwiftUI

// MARK: Storing user settings with AppStorage

struct Example6: View {
	// Storing lots of data in AppStorage is a bad idea
	@AppStorage("tapCount") private var tapCount = 0
    var body: some View {
		Button("Tap Count: \(tapCount)") {
			tapCount += 1
		}
    }
}

struct Example6_Previews: PreviewProvider {
    static var previews: some View {
        Example6()
    }
}
