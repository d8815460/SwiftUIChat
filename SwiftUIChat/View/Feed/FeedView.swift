//
//  FeedView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2023/1/6.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(viewModel.posts) { post in
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                }
            }.padding(.top)
        }
    }
}

//struct FeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedView()
//    }
//}
