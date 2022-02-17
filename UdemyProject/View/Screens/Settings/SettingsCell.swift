//
//  SettingsCell.swift
//  UdemyProject
//
//  Created by mac on 26.08.2021.
//

import SwiftUI

struct SettingsCell: View {
    let viewModel: SettingsCellViewModel
    var body: some View {
        VStack{
            HStack{
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .padding(6)
                    .background(viewModel.backgroundColor)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                
                Text(viewModel.tittle)
                    .font(.system(size: 15))
                    
                    Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .padding(.trailing)
                    
                }.padding([.horizontal, .top])
            
            Divider()
                .padding(.leading)
            }.background(Color.white)
    }
}


