//
//  CustomInputView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var text: String

    var action: () -> Void

    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)

            HStack {
                TextField("Message..", text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.body)
                    .frame(minHeight: 30)
                    .padding(.leading, 8)

                Button(action: action, label: {
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                })
                .padding(.bottom, 8)
                .padding(.horizontal)
            }
        }
    }
}

//struct CustomInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomInputView(text: .constant("text"), action: nil)
//    }
//}
