//
//  UserStore.swift
//  The Starry Night
//
//  Created by 이재승 on 5/2/24.
//

import Foundation

final class UserStore {
    // 싱글톤으로 생성
    static let shared = UserStore()
    
    var user: UserModel?
    
    private init() { }
}
