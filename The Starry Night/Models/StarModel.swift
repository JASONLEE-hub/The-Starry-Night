//
//  StarModel.swift
//  The Starry Night
//
//  Created by 이재승 on 5/2/24.
//

import SwiftUI

struct StarModel: Identifiable, Encodable, Decodable {
    var id: String = UUID().uuidString
    var author: String = UserStore.shared.user?.userName ?? "이름없음"
    var title: String
    // 해시태그 picker로 나중에 생각하기
    var text: String
    var dear: String
    var bgInt: Int
    var bg: Color {
        switch bgInt {
        case 0 :
            return .point
        case 1 :
            return .pointColor2
        case 2 :
            return .pointColor3
        case 3 :
            return .pointColor4
        default :
            return .point
        }
    }
    
    static let starDummy: StarModel = StarModel(title: "Star", text: "StarText", dear: "Moon", bgInt: 1)
}
