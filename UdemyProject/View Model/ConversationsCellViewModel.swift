//
//  ConversationsCellViewModel.swift
//  UdemyProject
//
//  Created by mac on 29.09.2021.
//

import SwiftUI

class ConversationsCellViewModel: ObservableObject {
   
    @Published var  message: Message
    init(_ message: Message){
        self.message = message
        fetchUser()
        
    }
    
    var chatPartnerId : String{
        return message.fromId == AuthViewModel.shared.userSession?.uid ? message.toId : message.fromId
    }
    
        var partnersProfilePhotoUrl: URL?{
            guard let user = message.user else { return nil }
            return  URL(string: user.profileImageUrl)
        }
    
    var fullname: String {
        guard let user = message.user else { return "" }
        return user.fullname
    }
    
    func fetchUser () {
        
        COLLECTION_USERS.document(chatPartnerId).getDocument { snapshot, _ in
            self.message.user = try? snapshot?.data(as: User.self)
        } 
}
}
