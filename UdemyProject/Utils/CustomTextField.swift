//
//  CustomTextField.swift
//  UdemyProject
//
//  Created by mac on 24.08.2021.
//

import SwiftUI

struct CustomTextField: View {
    let imageName: String
    let placeHolder: String
    let isSecureField : Bool
    @Binding var text: String
    var body: some View {
        VStack(spacing: 13) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                if isSecureField {
                    SecureField(placeHolder, text: $text)
                }else{
                    TextField(placeHolder, text: $text)
                }
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}


