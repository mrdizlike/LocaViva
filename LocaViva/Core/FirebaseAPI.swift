//
//  FirebaseAPI.swift
//  LocaViva
//
//  Created by Виктор on 28.06.2023.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseStorage
import FirebaseDatabase

class FirebaseAPI {
    static let shared = FirebaseAPI()
    
    private func configure() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
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

class AuthViewMode: ObservableObject {
    @Published var userSession: User?
    @Published var currentUser: User?
    
    init() {
        
    }
    
    func signIn(withEmail email: String, withPhone: String, password: String) async throws {
        
    }
    
    func createUser(withEmail email: String, withPhone: String, password: String, firstName: String, lastName: String, country: String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = UserData(id: result.user.uid, email: result.user.email!, phoneNumber: withPhone, firstName: firstName, lastName: lastName, country: country) //Понять как работать с кастомными данными (UPD: понял)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        } catch {
            print("something failed \(error.localizedDescription)")
        }
        
    }
    
    func signOut() {
        
    }
    
    func fetchUser() async {
        
    }
}
