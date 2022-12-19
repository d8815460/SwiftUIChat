//
//  PreviewProvider.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/19.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    let stat1 = StatisticModel(title: "Current Price",
                               value: "$21,543.00",
                               percentageChange: 1.23)
    
    let stat2 = StatisticModel(title: "Market Capitalization",
                               value: "$413.15Bn",
                               percentageChange: 1.67)
    
    let stat3 = StatisticModel(title: "Rank",
                               value: "1",
                               percentageChange: nil)
    
    let stat4 = StatisticModel(title: "Volume",
                               value: "35.99BVn",
                               percentageChange: nil)
    
    let sectionModel = CoinDetailSectionModel(title: "Overview",
                                              stats: [StatisticModel(title: "Current Price",
                                                                     value: "$21,543.00",
                                                                     percentageChange: 1.23),
                                                      StatisticModel(title: "Market Capitalization",
                                                                     value: "$413.15Bn",
                                                                     percentageChange: 1.67),
                                                      StatisticModel(title: "Rank",
                                                                     value: "1",
                                                                     percentageChange: nil),
                                                      StatisticModel(title: "Volume",
                                                                     value: "35.99BVn",
                                                                     percentageChange: nil)])

//    let coin = Coin(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "", currentPrice: 64, marketCap: <#T##Int#>, marketCapRank: <#T##Int#>, fullyDilutedValuation: <#T##Double?#>, totalVolume: <#T##Double?#>, high24H: <#T##Double?#>, low24H: <#T##Double?#>, priceChange24H: <#T##Double#>, priceChangePercentage24H: <#T##Double#>, marketCapChange24H: <#T##Double?#>, marketCapChangePercentage24H: <#T##Double?#>, circulatingSupply: <#T##Double?#>, toalSupply: <#T##Double?#>, maxSupply: <#T##Double?#>, ath: <#T##Double?#>, athChangePercentage: <#T##Double?#>, athDate: <#T##String?#>, atl: <#T##Double?#>, atlChangePercentage: <#T##Double?#>, atlDate: <#T##String?#>, lastUpdated: <#T##String?#>, sparklineIn7D: <#T##SparklineIn7D?#>, priceChangePercentage24HInCurrency: <#T##Double?#>)
}
