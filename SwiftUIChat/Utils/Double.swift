//
//  Double.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/19.
//

import Foundation

extension Double {

    private var currencyFormmater: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }

    private var numberFormmater: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }

    func toCurrency() -> String {
        return currencyFormmater.string(for: self) ?? "$0.00"
    }

    func toPercentString() -> String {
        guard let numberAsString = numberFormmater.string(for: self) else { return ""}
        return numberAsString + "%"
    }

    func asNumberStirng() -> String {
        return String(format: "%.2f", self)
    }

    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberStirng()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000_
            let stringFormatted = formatted.asNumberStirng()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberStirng()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberStirng()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumberStirng()
        default:
            return "\(sign)\(self)"
        }
    }
}
