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
                TextField("", text: $text)
                    .placeholder(when: text.isEmpty, placeholder: {
                        Text("Message...").foregroundColor(Color.theme.placeHolderColor)
                    })
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.body)
                    .frame(minHeight: 30)
                    .padding(.leading, 8)
                    .foregroundColor(Color.theme.primaryTextColor)

                Button(action: action, label: {
                    Text("Send")
                        .bold()
                        .foregroundColor(Color.theme.primaryTextColor)
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
