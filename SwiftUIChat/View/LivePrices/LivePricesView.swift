//
//  LivePricesView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/17.
//

import SwiftUI

struct LivePricesView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                // Top movers view
                TopMoversView()

                Divider()

                // all coins view
                AllCoinsView()
            }
            .navigationTitle("Live Prices")
        }
    }
}

struct LivePricesView_Previews: PreviewProvider {
    static var previews: some View {
        LivePricesView()
    }
}
