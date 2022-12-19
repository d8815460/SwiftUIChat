//
//  ChartView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/19.
//

import SwiftUI
import Charts

struct ChartView: View {

    let viewModel: CoinDetailsViewModel

    var body: some View {
        if #available(iOS 16.0, *) {
            Chart {
                ForEach(viewModel.chartData) { item in
                    LineMark(x: .value("Date", item.date),
                             y: .value("Price", item.value)
                    )
                    .interpolationMethod(.cardinal)
                }
            }
            .chartXScale(domain: ClosedRange(uncheckedBounds: (lower: viewModel.startDate, upper: viewModel.endDate)))
            .chartXAxis {
                AxisMarks(position: .bottom, values: viewModel.xAxisValues) { value in
                    AxisGridLine()
                    AxisValueLabel() {
                        if let dateValue = value.as(Date.self) {
                            Text(dateValue.asShortDateString())
                        }
                    }
                }
            }
            
            .chartYScale(domain: ClosedRange(uncheckedBounds: (lower: viewModel.minPrice, upper: viewModel.maxPrice)))
            .chartXAxis {
                AxisMarks(position: .trailing, values: viewModel.yAxisValues) { value in
                    AxisGridLine()
                    AxisValueLabel() {
                        if let doubleValue = value.as(Double.self) {
                            Text(doubleValue.formattedWithAbbreviations())
                        }
                    }
                }
            }
        } 
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(viewModel: CoinDetailsViewModel(coin: dev.coin))
    }
}
