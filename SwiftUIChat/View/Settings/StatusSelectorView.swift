//
//  StatusSelectorView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel = StatusViewModel()

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("CURRENTLY SET TO")
                        .foregroundColor(Color.theme.grayTextColor)
                        .padding()
                    
                    StatusCell(status: viewModel.status)

                    Text("SELECT YOUR STATUS")
                        .foregroundColor(Color.theme.grayTextColor)
                        .padding()
                    
                    // for loop with options
                                        
                    ForEach(UserStatus.allCases.filter({ $0 != .notConfigured }),
                            id: \.self) { status in
                        Button(action: {
                            viewModel.updateStatus(status)
                        }, label: {
                            StatusCell(status: status)
                        })
                    }
                }
            }
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}

struct StatusCell: View {
    let status: UserStatus
    
    var body: some View {
        HStack {
            Text(status.title)
                .foregroundColor(Color.theme.blackColor)
            Spacer()
        }
        .frame(height: 56)
        .padding(.horizontal)
        .background(Color.white)
    }
}
