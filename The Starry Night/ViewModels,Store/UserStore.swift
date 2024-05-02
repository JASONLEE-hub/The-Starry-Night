//
//  UserStore.swift
//  The Starry Night
//
//  Created by 이재승 on 5/2/24.
//

import Foundation
import FirebaseFirestore

final class UserStore: ObservableObject {
    // 싱글톤으로 생성
    static let shared = UserStore()
    
    var user: UserModel?
    
    private init() { }
    
    let db = Firestore.firestore().collection("Users")
    
    func saveUser(user: UserModel) {
        db.document(user.id).setData(user.toDictionary()) { error in
            if let error = error {
                print("에러 내용 : \(error)")
            } else {
                print("저장 완료")
            }
        }
    }
    
    func fetchUser(completion: @escaping (UserModel?) -> Void) {
        let db = Firestore.firestore()
        db.document(user?.id ?? "").getDocument { document, error in
            if let document = document, document.exists {
                let result = try? document.data(as: UserModel.self)
                completion(result)
            } else {
                print("Document does not exist")
                completion(nil)
            }
        }
    }

}
