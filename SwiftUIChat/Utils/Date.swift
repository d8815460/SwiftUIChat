//
//  Date.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/19.
//

import Foundation

extension Date {

    // "2021-03-13T23:18:10.268Z"
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }

    private var shortDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter
    }

    func asShortDateString() -> String {
        return shortDateFormatter.string(from: self)
    }
}
