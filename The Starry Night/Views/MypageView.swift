//
//  MypageView.swift
//  The Starry Night
//
//  Created by 이재승 on 2023/11/11.
//

import SwiftUI

struct MypageView: View {
    @State var name: String = "재승"
    
    var body: some View {
        NavigationStack {
            Text("안녕하세요. \(name)님!")
        }
        .navigationTitle("My Page")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.green))
        .ignoresSafeArea()
        .animation(.none, value: 0)
    }
}

#Preview {
    MypageView()
}
