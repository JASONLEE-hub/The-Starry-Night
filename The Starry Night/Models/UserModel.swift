//
//  UserModel.swift
//  The Starry Night
//
//  Created by 이재승 on 5/2/24.
//

import Foundation

struct UserModel: Codable {
    /// User Name
    var userName: String
    /// User Stars
    var userStarsID: [String]?
    /// User Coments
    var userComentsID: [String]?
}
