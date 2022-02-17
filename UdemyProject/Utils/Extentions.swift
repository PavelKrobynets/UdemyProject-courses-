//
//  Extentions.swift
//  UdemyProject
//
//  Created by mac on 06.09.2021.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
