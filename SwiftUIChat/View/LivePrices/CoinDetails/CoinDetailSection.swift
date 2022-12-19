//
//  CoinDetailSection.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/19.
//

import SwiftUI

struct CoinDetailSection: View {
    let model: CoinDetailSectionModel

    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack {
            Text(model.title)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)

            LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                ForEach(model.stats) { stat in
                    StatisticView(model: stat)
                }
            }
        }
    }
}

struct CoinDetailSection_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailSection(model: dev.sectionModel)
    }
}
