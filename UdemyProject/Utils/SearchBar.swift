//
//  SearchBar.swift
//  UdemyProject
//
//  Created by mac on 06.09.2021.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing : Bool
    var body: some View {
        HStack{
         Label(
            title: { TextField("Search", text: $text).foregroundColor(.black)  },
            icon: { Image(systemName: "magnifyingglass") }
         ).padding(8)
         .padding(.horizontal, 10)
         .background(Color(.systemGray6))
         .frame(width: UIScreen.main.bounds.width - 30)
         .cornerRadius(8)
         .foregroundColor(Color(.systemGray))
        
        if isEditing{
            Button(action:{
                isEditing = false
                text = ""
                UIApplication.shared.endEditing()
            } ){
                Image(systemName: "delete.left")
                    .frame(width: 15, height: 10)
                    .foregroundColor(Color(.darkGray))
            }.padding(.trailing, 8)
            .transition(.move(edge: .trailing) )
            .animation(.default)
        }
        }
         }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search"), isEditing: .constant(false))
    }
}
