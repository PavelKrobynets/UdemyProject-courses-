//
//  UserCell.swift
//  UdemyProject
//
//  Created by mac on 06.09.2021.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user : User
    var body: some View {
        VStack {
            HStack{
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                
                VStack(alignment: .leading){
                    Text(user.username)
                        .font(.system(size: 13, weight: .semibold))
                    
                    Text(user.fullname)
                        .font(.system(size: 14, weight: .light))
                }
                Spacer()
            }.padding(.horizontal)
        }
    }
}


