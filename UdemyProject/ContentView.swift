//
//  ContentView.swift
//  UdemyProject
//
//  Created by mac on 23.08.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
//        Group {
//            if viewModel.userSession != nil {
//                MainTabView()
//            }else{
//                LoginView()
//            }
//        }.preferredColorScheme(.light)
        LoginView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
