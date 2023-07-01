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

@MainActor //Часть ассинхроночки, означает, что этот блок кода должен выполняться в основной очереди
class AuthViewMode: ObservableObject {
    @Published var userSession: User? //Проверяем в аккаунте пользователь или нет. публишд используем чтобы следить за изменениями
    @Published var currentUser: UserData?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("something failed \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, withPhone: String, password: String, firstName: String, lastName: String, country: String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = UserData(id: result.user.uid, email: result.user.email!, phoneNumber: withPhone, firstName: firstName, lastName: lastName, country: country) //Понять как работать с кастомными данными (UPD: понял)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("something failed \(error.localizedDescription)")
        }
        
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("failed to sign out: \(error.localizedDescription)")
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: UserData.self)
    }
}
