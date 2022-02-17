//
//  StatusSelectorView.swift
//  UdemyProject
//
//  Created by mac on 01.09.2021.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel = StatusViewModel()
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            ScrollView{
                VStack(alignment: .leading){
                    HStack {
                        Text("CURRENTLY SET TO")
                            .foregroundColor(.gray)
                            .padding()
                   
                    }
                    
                    StatusCell(status: viewModel.status)
                    
                    Text("SELECT YOUR STATUS")
                        .foregroundColor(.gray)
                        .padding()
                    
                    ForEach(UserStatus.allCases.filter({ $0 != .notConfigured }), id: \.self){ status in
                        Button(action: {
                            viewModel.upgradeStatus(status)
                        }){
                            StatusCell(status: status)
                        }
                        
                    }
                }
            }
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}

struct StatusCell: View {
    let status: UserStatus
    var body: some View {
        HStack{
            Text(status.title)
                .foregroundColor(.black)
            Spacer()
        }.padding(.leading)
        .frame(height: 47)
        .background(Color.white)
    }
}
