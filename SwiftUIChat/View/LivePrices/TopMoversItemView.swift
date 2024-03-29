//
//  TopMoversItemView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/17.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {

    let coin: Coin

    var body: some View {
        VStack {
            // image
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom, 8)

            // coin info
            HStack(spacing: 2) {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                .fontWeight(.bold)

                Text("\(coin.currentPrice)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            // coin percent change
            Text("\(coin.priceChangePercentage24H)")
                .font(.title2)
                .foregroundColor(.green)

        }
        .frame(width: 140, height: 140)
        .background(Color(ITEMBACKGROUNDCOLOR))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
        )
    }
}

//struct TopMoversItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversItemView()
//    }
//}
