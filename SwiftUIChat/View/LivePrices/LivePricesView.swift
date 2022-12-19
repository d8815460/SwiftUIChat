//
//  LivePricesView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/17.
//

import SwiftUI

struct LivePricesView: View {

    @StateObject var viewModel = LivePricesViewModel()

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(alignment: .leading) {
                    // Top movers view
                    TopMoversView(viewModel: viewModel)

                    Divider()

                    // all coins view
                    AllCoinsView(viewModel: viewModel)
                }
            }
        }
    }
}

//struct LivePricesView_Previews: PreviewProvider {
//    static var previews: some View {
//        LivePricesView()
//    }
//}
