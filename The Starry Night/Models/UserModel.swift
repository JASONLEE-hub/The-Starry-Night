//
//  UserModel.swift
//  The Starry Night
//
//  Created by 이재승 on 5/2/24.
//

import Foundation

struct UserModel: Identifiable, Codable {
    /// UserID
    var id: String = UUID().uuidString
    /// User Name
    var userName: String
    /// User Stars
    var userStars: [String]?
    /// User Coments
    var userComents: [String]?
    
    // Firestore에서 사용하기 위해 Dictionary로 변환
    func toDictionary() -> [String: Any] {
        return [
            "userName": userName,
            "userStars": userStars ?? [],
            "userComents": userComents ?? []
        ]
    }
}
