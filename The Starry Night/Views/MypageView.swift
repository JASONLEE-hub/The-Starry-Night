//
//  MypageView.swift
//  The Starry Night
//
//  Created by 이재승 on 2023/11/11.
//

import SwiftUI

struct MypageView: View {
    @StateObject var userStore = UserStore.shared
    
    var body: some View {
        NavigationStack {
            Text("안녕하세요. \(userStore.user?.userName ?? "익명")님!")
        }
        .navigationTitle("My Page")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.green))
        .ignoresSafeArea()
        .animation(.none, value: 0)
    }
}

#Preview {
    MypageView(userStore: UserStore.shared)
}
