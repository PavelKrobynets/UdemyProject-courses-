//
//  CustomInputView.swift
//  UdemyProject
//
//  Created by mac on 07.09.2021.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var text : String
    var action: () -> Void
    var body: some View {
        VStack{
            Divider()
            HStack{
                TextField("Message...", text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.gray)
                    .font(.body)
                    .frame(minHeight: 30)
                Button(action: action){
                    Text("Send")
                        .bold()
                        .foregroundColor(Color(.systemTeal))
                }
                
            }.padding()
            .background(Color(.secondarySystemBackground))
        }
    }
}

