//
//  AddView.swift
//  The Starry Night
//
//  Created by 이재승 on 2023/11/11.
//

import SwiftUI

struct AddView: View {
    // UserStore.shared
    @StateObject var starStore = StarStore()
    @Binding var tabIndex: TabIndex
    
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 d일 a h:mm"
        return dateFormatter.string(from: Date())
    }
    @State private var dear: String = ""
    @State private var title: String = ""
    @State private var text: String = ""
    @State private var showingAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            // Dear. 이름으로 자동완성되어야함.
            Text("오늘 하루, 누군가에게 보내질 편지에요.")
            Text("진심을 담아 작성해주세요.")
            TextField("제목을 적어주세요.", text: $title)
                .padding(.leading)
                .padding(.top)
            
            TextField("내용을 적어주세요.", text: $text)
                .padding()
            
            Spacer()
            
            TextField("누구에게 적을지 적어주세요.", text: $dear)
                .padding(.leading)
                .padding(.top)
            
            Rectangle()
                .foregroundStyle(Color(.white))
                .frame(height: 60)
        }
        .navigationTitle(currentDate)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button() {
                    showingAlert = true
                } label: {
                    Image(systemName: "paperplane")
                }
                
            }
        }
        .animation(.none, value: 0)
        .alert("추가하시나요?", isPresented: $showingAlert) {
            Button("OK", role: .destructive) {
                let newStar: StarModel = StarModel(title: title, text: text, dear: dear, bgInt: 0)
                UserStore.shared.updateUserStarID(newUserStarID: newStar.id)
                starStore.saveStar(star: newStar)
                
                withAnimation(.smooth) {
                    tabIndex = .home
                }
            }
        }

    }
}

#Preview {
    NavigationStack {
        AddView(tabIndex: .constant(TabIndex.add))
    }
}
