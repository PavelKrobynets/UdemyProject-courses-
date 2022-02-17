//
//  RegistrationView.swift
//  UdemyProject
//
//  Created by mac on 23.08.2021.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var pass = ""
    @State private var userName = ""
    @State private var fullName = ""
    @Environment (\.presentationMode) var mode
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        VStack {
            NavigationLink(
                destination: ProfilePhotoSelectorView (),
                isActive: $viewModel.didAuthenticateUser,
                label: { })
            VStack(alignment: .leading, spacing: 10){
                HStack{Spacer()}
                Text("Get started")
                    .font(.largeTitle)
                    .bold()
                
                Text("Create your account")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                VStack(spacing: 50){
                    CustomTextField(imageName: "envelope",
                                    placeHolder: "Email",
                                    isSecureField: false,
                                    text: $email)
                    CustomTextField(imageName: "person",
                                    placeHolder: "Username",
                                    isSecureField: false,
                                    text: $userName)
                    CustomTextField(imageName: "person",
                                    placeHolder: "Full name",
                                    isSecureField: false,
                                    text: $fullName)
                    
                    CustomTextField(imageName: "lock",
                                    placeHolder: "Password",
                                    isSecureField: true,
                                    text: $pass)
                    
                }
                .padding([.horizontal, .top], 32)
            }.padding(.leading)
            Button(action: {
                viewModel.register(withEmail: email, username: userName,
                                  fullname: fullName, password: pass)
            }){
                Text("Sing up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
                
                
            }.shadow(color: .gray, radius: 9)
            .padding(.top, 15)
            
            Spacer()
            
            Button(action: {
                mode.wrappedValue.dismiss()
            }){
                HStack{
                    Text("Already have an account ?")
                        .font(.system(size: 14))
                    Text("Sign in")
                        .font(.system(size: 14, weight: .semibold))
                }
            }.padding(.bottom, 32)
            
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
