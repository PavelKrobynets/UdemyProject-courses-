//
//  Message.swift
//  UdemyProject
//
//  Created by mac on 07.09.2021.
//

import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Decodable{
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
    
    var user : User? 
}
