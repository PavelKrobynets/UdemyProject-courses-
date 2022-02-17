//
//  HideKeyboard.swift
//  UdemyProject
//
//  Created by mac on 07.09.2021.
//

import SwiftUI

#if canImport(UIKit)
extension View{
    func hideKeyboard () {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
