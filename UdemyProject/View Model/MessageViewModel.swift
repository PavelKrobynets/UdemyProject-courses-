//
//  MessageViewModel.swift
//  UdemyProject
//
//  Created by mac on 27.09.2021.
//

import Foundation

struct MessageViewModel {
    let message : Message
    init(_ message: Message){
        self.message = message
    }
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser : Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl : URL? {
        guard let profileImage = message.user?.profileImageUrl else { return nil }
        return URL(string: profileImage)
    }
    }

