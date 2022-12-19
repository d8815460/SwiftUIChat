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
        NavigationView {
            ScrollView {
                // chart

                // overview
                CoinDetailSection(model: viewModel.overviewSectionModel)
                    .padding(.vertical)

                // additional detils
                CoinDetailSection(model: viewModel.additionalDetailsSectionModel)
                    .padding(.vertical)
            }
            .padding()
            .navigationTitle("Bitcoin")
        }
    }
}

//struct CoinDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinDetailsView()
//    }
//}
