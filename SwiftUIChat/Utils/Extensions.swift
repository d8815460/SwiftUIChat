//
//  Extensions.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
