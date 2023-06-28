//
//  FirebaseAPI.swift
//  LocaViva
//
//  Created by Виктор on 28.06.2023.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseDatabase

class FirebaseAPI {
    
    static let shared = FirebaseAPI()
    
    private func configure() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
    
    func getPost(collection: String, docName: String, completion: @escaping (ParseDoc?) -> Void) {
        let db = configure()
        db.collection(collection).document(docName).getDocument(completion: {(document, error) in
            guard error == nil else { completion(nil); return}
            let doc = ParseDoc(firstField: document?.get("field1") as! String, secondField: document?.get("field2") as! String)
            completion(doc)
        })
    }
    
    func getImage(pictureName: String, completion: @escaping (UIImage) -> Void) {
        let storage = Storage.storage()
        let reference = storage.reference()
        let pathRef = reference.child("pictures")
        
        var image: UIImage = UIImage(named: "Logo")!
        
        let fileRef = pathRef.child(pictureName + ".jpeg")
        fileRef.getData(maxSize: 1024*1024, completion: {(data, error) in
            guard error == nil else { completion(image); return }
            image = UIImage(data: data!)!
            completion(image)
        })
    }
}
