//
//  ProfilePhotoSelectorView.swift
//  UdemyProject
//
//  Created by mac on 14.09.2021.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var laterTapped = false
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    var body: some View {
       
            VStack{ 
                Button(action: {
                    imagePickerPresented.toggle()
                }){
                    if let profileImage = profileImage{
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 180)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 7)
                        
                    }else{
                        Image("lake")
                            .resizable()
                            .scaleEffect()
                            .frame(width: 180, height: 180)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 7)
                    }
                }.sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })
                Text(profileImage == nil ? "Select profile photo" : "Great ! tap below to continue")
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.top)
                
                if let image = selectedImage {
                    Button(action: {
                        AuthViewModel.shared.uploadProfileImage(image)
                    }){
                            Text("Continue")
                                .frame(width: UIScreen.main.bounds.width - 100, height: 50)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .shadow(radius: 4)
                    }.padding(.top, 24)
                    } else {
                    Button(action: {
                        laterTapped = true
                    }, label: {
                        Text("Select later")
                            .padding()
                    })
                }
                NavigationLink(
                    destination: MainTabView(),
                    isActive: $laterTapped,
                    label: {
                    })
                
            }.navigationBarBackButtonHidden(true)
            .offset(y: -100 )
        
        
    }
    func loadImage(){
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}




    
struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}

   
