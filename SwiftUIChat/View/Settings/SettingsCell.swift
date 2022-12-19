//
//  SettingsCell.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//

import SwiftUI

struct SettingsCell: View {
    let viewModel: SettingsCellViewModel

    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .padding(6)
                    .background(viewModel.backgroundColor)
                    .foregroundColor(Color.theme.whiteColor)
                    .cornerRadius(6)
                
                Text(viewModel.title)
                    .font(.system(size: 15))
                
                Spacer()
                                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.theme.grayTextColor)
            }
            .padding([.top, .horizontal])
            
            Divider()
                .padding(.leading)
        }
        .background(Color.theme.whiteColor)
    }
}

struct SettingsCell_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SettingsCellViewModel(rawValue: 1)
        SettingsCell(viewModel: viewModel!)
    }
}
