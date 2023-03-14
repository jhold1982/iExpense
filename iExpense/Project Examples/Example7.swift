//
//  Example7.swift
//  iExpense
//
//  Created by Justin Hold on 3/14/23.
//

import SwiftUI

// MARK: Archiving Swift objects with Codable

// for JSON - JavaScript Object Notation
struct Example7User: Codable {
	let firstName: String
	let lastName: String
}

struct Example7: View {
	@State private var example7User = Example7User(firstName: "Taylor", lastName: "Swift")
    var body: some View {
		Button("Save User Data") {
			let encoder = JSONEncoder()
			if let data = try? encoder.encode(example7User) {
				UserDefaults.standard.set(data, forKey: "UserData")
			}
		}
    }
}

struct Example7_Previews: PreviewProvider {
    static var previews: some View {
        Example7()
    }
}
