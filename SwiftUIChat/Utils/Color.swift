//
//  Color.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/19.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let primaryTextColor = Color(TEXTCOLOR)
    let grayTextColor = Color(TEXTGRAYCOLOR)
    let itemBackgroundColor = Color(ITEMBACKGROUNDCOLOR)
    let whiteColor = Color(WHITECOLOR)
    let blackColor = Color(BLACKCOLOR)
    let placeHolderColor = Color(PLACEHOLDERCOLOR)
    
}
