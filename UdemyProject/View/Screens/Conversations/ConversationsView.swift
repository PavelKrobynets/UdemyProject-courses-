//
//  ConversationsView.swift
//  UdemyProject
//
//  Created by mac on 24.08.2021.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showNewMessageView = false
    @State private var showChatView = false
    @State var selectedUser: User?
    @ObservedObject var viewModel = ConversationsViewModel()
    var body: some View {
        ZStack(alignment: .bottom){
            
            if let user = selectedUser {
                NavigationLink(destination: ChatView(user: user)
                               , isActive: $showChatView,
                               label: { })
               
            }
            ScrollView{
                VStack{
                    ForEach(viewModel.recentMessages ){ message in
                        ConversationCell(viewModel: ConversationsCellViewModel(message))
                    }
                }
            }
            
            Button(action: {
                showNewMessageView = true
            }){
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding()
            }.background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .offset(x: UIScreen.main.bounds.width / 2.5)
            .sheet(isPresented: $showNewMessageView, content: {
                NewMessageView(showChatView: $showChatView, user: $selectedUser)
            })
        }.onAppear {
            viewModel.fetchRecentMessages()
        }
    }
}


