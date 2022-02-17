//
//  MessageView.swift
//  UdemyProject
//
//  Created by mac on 07.09.2021.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    let viewModel : MessageViewModel
    let user : User
    var body: some View {
        HStack{
            if viewModel.isFromCurrentUser {
                Spacer()
                Text(viewModel.message.text)
                    .padding(11)
                    .background(Color(.systemBlue))
                    .font(.system(size: 15))
                    .clipShape(ChatBubble(isFromCurrentUser : true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.leading, 70)
            }else{
                HStack(alignment: .bottom){
                    KFImage(viewModel.profileImageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    
                    Text(viewModel.message.text )
                        .padding(11)
                        .background(Color(.systemGray))
                        .font(.system(size: 15))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                }.padding(.horizontal)
                .padding(.trailing, 50)
                Spacer()
            }
        }
    }
}

