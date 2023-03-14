//
//  Example1.swift
//  iExpense
//
//  Created by Justin Hold on 3/13/23.
//

// MARK: Why @State only works with Structs

import SwiftUI

struct Example1User {
	var firstName = "Bilbo"
	var lastName = "Baggins"
}

struct Example1: View {
	@State private var example1User = Example1User()
    var body: some View {
		VStack {
			Spacer()
			Section("Your Name Is:") {
				Text("\(example1User.firstName) \(example1User.lastName)")
					.padding()
			}
			Spacer()
			Section("Enter your name") {
				TextField("First name", text: $example1User.firstName)
				TextField("Last name", text: $example1User.lastName)
			}
			.padding()
			Spacer()
			
		}
    }
}

struct Example1_Previews: PreviewProvider {
    static var previews: some View {
        Example1()
    }
}
