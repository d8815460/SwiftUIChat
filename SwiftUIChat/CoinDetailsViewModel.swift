//
//  CoinDetailsViewModel.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/19.
//

import Foundation

class CoinDetailsViewModel {

    private let coin: Coin

    var overviewSectionModel: CoinDetailSectionModel {
        // pirce stats
        let price = coin.currentPrice.toCurrency()
        let pricePercentChange = coin.priceChangePercentage24H
        let priceStats = StatisticModel(title: "Current Price",
                                        value: price,
                                        percentageChange: pricePercentChange)

        // market cap stats
        let marketCap = coin.marketCap
        let marketCapPercentChange = coin.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "Market Capitalization",
                                           value: "\(marketCap)",
                                           percentageChange: marketCapPercentChange)

        // rank stats
        let rank = coin.marketCapRank
        let rankStat = StatisticModel(title: "Rank",
                                      value: "\(rank)",
                                      percentageChange: nil)

        // volume stats
        let volume = coin.totalVolume
        let volumeStat = StatisticModel(title: "Volume",
                                        value: "\(volume ?? 0)",
                                        percentageChange: nil)

    
        return CoinDetailSectionModel(title: "Overview",
                                      stats: [priceStats, marketCapStat, rankStat, volumeStat])
    }

    var additionalDetailsSectionModel: CoinDetailSectionModel {
        // 24H High
        let high = coin.high24H?.toCurrency() ?? "n/a"
        let highStat = StatisticModel(title: "24 H Hight",
                                      value: high,
                                      percentageChange: nil)

        // 24H Low
        let low = coin.low24H?.toCurrency() ?? "n/a"
        let lowStat = StatisticModel(title: "24H Low",
                                     value: low,
                                     percentageChange: nil)

        // 24H Price change
        let priceChange24H = coin.priceChange24H.toCurrency()
        let percentChange24H = coin.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24H Price Change",
                                             value: priceChange24H,
                                             percentageChange: percentChange24H)

        // 24H market cap change
        let marketCapChange24H = coin.marketCapChange24H?.toCurrency() ?? "n/a"
        let marketCapChangePercent = coin.marketCapChangePercentage24H
        let marketStat = StatisticModel(title: "24H Market Cap Change",
                                        value: marketCapChange24H,
                                        percentageChange: marketCapChangePercent)

        return CoinDetailSectionModel(title: "AdditionalDetail", stats: [highStat,
                                                                         lowStat,
                                                                         priceChangeStat,
                                                                         marketStat])
    }

    init(coin: Coin) {
        self.coin = coin
    }
}
