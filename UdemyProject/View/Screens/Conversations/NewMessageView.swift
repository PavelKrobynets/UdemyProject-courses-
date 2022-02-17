//
//  NewMessageView.swift
//  UdemyProject
//
//  Created by mac on 06.09.2021.
//

import SwiftUI

struct NewMessageView: View {
    @Binding var showChatView: Bool
    @Environment (\.presentationMode) var mode
    @State private var searchText = ""
    @State private var isEditing = false
    @Binding var user: User?
    @ObservedObject var viewModel = NewMessageViewModel()
    var body: some View {
        SearchBar(text: $searchText, isEditing: $isEditing)
            .onTapGesture { isEditing.toggle() }
            .padding()
        ScrollView{
            
            VStack{
                ForEach(viewModel.users){ user in
                    Button(action: {
                        showChatView.toggle()
                        self.user = user
                        mode.wrappedValue.dismiss()
                    }){
                        UserCell(user: user)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}


