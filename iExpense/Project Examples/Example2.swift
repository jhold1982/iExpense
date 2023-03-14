//
//  Example2.swift
//  iExpense
//
//  Created by Justin Hold on 3/14/23.
//

// MARK: Sharing SwiftUI State with @StateObject

import SwiftUI

// when something changes in a CLASS, you need @StateObject inside the struct,
// and class must conform to ObservableObject,
// and the class lets/vars need to be @Published

// 1. class conforms to ObservableObject
// 2. vars must be marked as @Published
// 3. struct must include @StateObject to referrence the class

// @StateObject is when creating the data for the first time
// @ObservedObject var example: Example() for when reading, not creating

class Example2User: ObservableObject {
	@Published var firstName = "Bilbo"
	var lastName = "Baggins"
}

struct Example2: View {
	@StateObject var example2User = Example2User()
    var body: some View {
		VStack {
			Spacer()
			Section("This is your name") {
				Text("Your name is \(example2User.firstName) \(example2User.lastName)")
			}
			.padding()
			Spacer()
			Section("Enter your name") {
				TextField("First name", text: $example2User.firstName)
				TextField("Last name", text: $example2User.lastName)
			}
			.padding()
			Spacer()
		}
    }
}

struct Example2_Previews: PreviewProvider {
    static var previews: some View {
        Example2()
    }
}
