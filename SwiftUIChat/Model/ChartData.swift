//
//  ChartData.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/19.
//

import Foundation

struct ChartData: Identifiable {
    let id = UUID().uuidString
    let date: Date
    let value: Double
}
