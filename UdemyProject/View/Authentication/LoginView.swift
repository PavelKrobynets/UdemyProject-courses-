//
//  LoginView.swift
//  UdemyProject
//
//  Created by mac on 23.08.2021.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var pass = ""
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 10){
                    HStack{Spacer()}
                    Text("Hello")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Welcome back")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.blue)
                    
                    VStack(spacing: 20){
                        CustomTextField(imageName: "envelope",
                                        placeHolder: "Email",
                                        isSecureField: false,
                                        text: $email)
                        
                        CustomTextField(imageName: "lock",
                                        placeHolder: "Password",
                                        isSecureField: true,
                                        text: $pass)
                        
                    }
                    .padding([.horizontal, .top], 32)
                    
                }.padding(.leading)
                HStack{
                    Spacer()
                    
                   NavigationLink(
                    destination: Text("Reset password ..."),
                    label: {
                        Text("Forgot password ?")
                            .font(.system(size: 13, weight: .semibold))
                            .padding(.top)
                            .padding(.trailing, 28)
                    })
                }
                
                Button(action: {
                    AuthViewModel.shared.login(withEmail: email, password: pass)
                }){
                    Text("Sing in")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                    
                    
                }.shadow(color: .gray, radius: 9)
                
                Spacer()
                
                NavigationLink(
                    destination: RegistrationView()
                        .navigationBarBackButtonHidden(true),
                    
                    label: {
                        HStack{
                            Text("Don't have an account ? ")
                                .font(.system(size: 14))
                            Text("Sign up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                    }).padding(.bottom, 32)
            }
        }.padding(.top, -58)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


