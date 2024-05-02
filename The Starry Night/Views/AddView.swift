//
//  AddView.swift
//  The Starry Night
//
//  Created by 이재승 on 2023/11/11.
//

import SwiftUI

struct AddView: View {
    
    @Binding var tabIndex: TabIndex
    
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 d일 a h:mm"
        return dateFormatter.string(from: Date())
    }
    @State private var dear: String = ""
    @State private var title: String = ""
    @State private var hashtag: String = ""
    @State private var text: String = ""
    @State private var showingAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            // Dear. 이름으로 자동완성되어야함.
            Text("오늘 하루, 누군가에게 보내질 편지에요.")
                .foregroundStyle(.blue).opacity(0.8)
            Text("진심을 담아 작성해주세요.")
                .foregroundStyle(.blue).opacity(0.8)
            TextField("누구에게 적을지 적어주세요.", text: $dear)
                .padding()
            
            TextField("내용을 적어주세요.", text: $text)
                .padding()
            
            Spacer()
            
            TextField("제목을 적어주세요.", text: $title)
                .padding()
            TextField("#해시태크를 적어주세요.", text: $hashtag)
                .padding()
            
            Rectangle()
                .foregroundStyle(Color(.white))
                .frame(height: 60)
        }
        .navigationTitle(currentDate)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button() {
                    showingAlert = true
                } label: {
                    Image(systemName: "plus.app.fill")
                        .foregroundStyle(.black)
                }
                
            }
        }
        .animation(.none, value: 0)
        .alert("추가하시나요?", isPresented: $showingAlert) {
            Button("OK", role: .destructive) {
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
