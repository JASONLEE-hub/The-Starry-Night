//
//  UserStore.swift
//  The Starry Night
//
//  Created by 이재승 on 5/2/24.
//

import Foundation
import Combine

final class UserStore: ObservableObject {
    // 싱글톤으로 생성
    static let shared = UserStore()
    
    @Published var user: UserModel?
    
    private var cancellables = Set<AnyCancellable>()

    private init() {
        // 유저모델을 불러오거나 없으면 이름을 익명으로 초기화하여 가져오기
        self.user = loadUserModel() ?? UserModel(userName: "익명") // 초기 값 로드
        // 아래 내용 챗GPT 잘모르겠다.
        $user // 유저 내용이 변경되면 작동하는건가?
            .compactMap { $0?.userName }  // nil을 제외하고 userName만 추출
            .sink { newUserName in
                print("New userName is \(newUserName)")
            }
            .store(in: &cancellables)
        // ...
    }
    
    // UserModel을 UserDefaults에 저장
    func saveUserModel(user: UserModel) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: "UserModel")
        }
    }

    // UserDefaults에서 UserModel을 불러오기
    func loadUserModel() -> UserModel? {
        if let userData = UserDefaults.standard.data(forKey: "UserModel") {
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(UserModel.self, from: userData) {
                return user
            }
        }
        return nil
    }
    
    // UserModel의 userName만 업데이트하는 함수
    func updateUserName(newUserName: String) {
        if var user = loadUserModel() {
            user.userName = newUserName  // userName을 새로운 값으로 업데이트
            saveUserModel(user: user)    // 변경된 UserModel을 다시 저장
        }
    }
    
    // UserModel의 StarID만 업데이트하는 함수
    func updateUserStarID(newUserStarID: String) {
        if var user = loadUserModel() {
            user.userStarsID?.append(newUserStarID)  // userStarsID을 새로운 값으로 업데이트
            saveUserModel(user: user)    // 변경된 UserModel을 다시 저장
        }
    }
    
    // UserModel의 CommentID만 업데이트하는 함수
    func updateUserCommentID(newUserCommentID: String) {
        if var user = loadUserModel() {
            user.userComentsID?.append(newUserCommentID)  // userComentsID을 새로운 값으로 업데이트
            saveUserModel(user: user)    // 변경된 UserModel을 다시 저장
        }
    }
}
