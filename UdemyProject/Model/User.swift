//
//  User.swift
//  UdemyProject
//
//  Created by mac on 18.09.2021.
//

import Foundation
import FirebaseFirestoreSwift


struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let email: String
    let username: String
    let fullname: String
    var profileImageUrl: String
    
}

let MOCK_USER = User(id: NSUUID().uuidString, email: "email", username: "test", fullname: "test", profileImageUrl: "test")
