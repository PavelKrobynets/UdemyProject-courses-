//
//  ImageUploader.swift
//  UdemyProject
//
//  Created by mac on 17.09.2021.
//

import Firebase
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print ("DEBUG:Failed to upload image with error \(error.localizedDescription) ")
                return
            }
            
            print("DEBUG: successfully uploaded image to firestore")
            
            ref.downloadURL { url, error in
                guard let imageUrl = url?.absoluteString else{ return }
                completion(imageUrl)
                
                if let error = error {
                     print("DEBUG: Failed to download image with error \(error.localizedDescription)")
                }
            }
        }
    }
}
