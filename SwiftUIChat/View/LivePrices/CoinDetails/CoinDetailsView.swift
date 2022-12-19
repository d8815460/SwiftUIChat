//
//  CoinDetailsView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/19.
//

import SwiftUI

struct CoinDetailsView: View {

    let viewModel: CoinDetailsViewModel

    init(coin: Coin) {
        self.viewModel = CoinDetailsViewModel(coin: coin)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            // chart
            ChartView(viewModel: viewModel)
                .frame(height: 250)
                .padding(.vertical)
                .shadow(color: viewModel.chartLineColor, radius: 5)
                .shadow(color: viewModel.chartLineColor.opacity(0.2), radius: 5)

            // overview
            CoinDetailSection(model: viewModel.overviewSectionModel)
                .padding(.vertical)

            // additional detils
            CoinDetailSection(model: viewModel.additionalDetailsSectionModel)
                .padding(.vertical)
        }
        .padding()
        .navigationTitle(viewModel.coinName)
    }
}

struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsView(coin: dev.coin)
    }
}
