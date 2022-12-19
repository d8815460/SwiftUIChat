//
//  TopMoversView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/17.
//

import SwiftUI

struct TopMoversView: View {

    @StateObject var viewModel: LivePricesViewModel

    var body: some View {
        VStack {
            Text("Top Movers")
                .font(.headline)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.topMovingCoins) { coin in
                        NavigationLink {
                            CoinDetailsView(coin: coin)
                        } label: {
                            TopMoversItemView(coin: coin)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

//struct TopMoversView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversView(viewModel: LivePricesViewModel())
//    }
//}
