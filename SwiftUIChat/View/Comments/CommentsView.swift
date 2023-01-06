//
//  CommentsView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2023/1/6.
//

import SwiftUI

struct CommentsView: View {
    @State var commentText = ""
    @ObservedObject var viewModel: CommentViewModel
    
    init(post: Post) {
        self.viewModel = CommentViewModel(post: post)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(viewModel.comments) { comment in
                        CommentCell(comment: comment)
                    }
                }
            }.padding(.top)

            CustomInputView(text: $commentText, action: uploadComment)
        }
    }

    func uploadComment() {
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
}

//struct CommentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsView()
//    }
//}
