//
//  ChatView.swift
//  UdemyProject
//
//  Created by mac on 24.08.2021.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @ObservedObject var viewModel : ChatViewModel
    private let user : User
    init (user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    var body: some View {
        VStack {
             ScrollView{
                VStack(alignment: .leading, spacing: 12){
                    ForEach(viewModel.messages){ message in
                        MessageView(viewModel: MessageViewModel(message), user: user)
                    }
                }
            }
            
            CustomInputView(text: $messageText, action: sendMessage )
            
        }.navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
        .onTapGesture {
            hideKeyboard()
        }
    }
    func sendMessage () {
        print(viewModel.sendMessage(messageText ))
        messageText = "" 
    }
}


