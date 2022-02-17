//
//  UserInfo.swift
//  UdemyProject
//
//  Created by mac on 07.09.2021.
//

import SwiftUI

struct UserInfo: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var date = Date()
    @State private var send = false
    @State private var numberOfLikes = 1
    var body: some View {
        NavigationView{
            VStack {
                Form{
                    Section(header:Text("personal information") ){
                        TextField("First name", text: $firstName)
                        TextField("Last name", text: $lastName)
                        DatePicker("Birth date", selection: $date, displayedComponents: .date)
                    }
                    
                    Section(header: Text("Actions")){
                        Toggle("Send notifications", isOn: $send)
                            .toggleStyle(SwitchToggleStyle(tint: .green))
                        Stepper("Number of likes", value: $numberOfLikes, in: 1...111)
                        Text("your profile has \(numberOfLikes)")
                        Link(destination: URL(string: "https://www.youtube.com/watch?v=ahgkb5ngMjo")!, label: {
                            Text("tutorial video ")
                        })
                    }
                }.accentColor(.green)
                .navigationTitle("Account")
                .foregroundColor(.primary)
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                        Button(action: {
                            hideKeyboard()
                        }){
                            Image(systemName: "keyboard")
                        }
                        Button(action: {
                            print("User saved")
                        }, label: {
                            Text("Save")
                        })
                    }
                }
            }
            
        }
        .accentColor(.green)
    }
}



struct UserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserInfo()
    }
}
