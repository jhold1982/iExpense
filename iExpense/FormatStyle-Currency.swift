//
//  FormatStyle-Currency.swift
//  iExpense
//
//  Created by Justin Hold on 9/5/22.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
		.currency(code: Locale.current.currency?.identifier ?? "USD")
    }
}
