//
//  StarDetailView.swift
//  The Starry Night
//
//  Created by 이재승 on 12/21/23.
//

import SwiftUI

struct StarDetailView: View {
    // 감성적인 무료 배경 이미지 사용하기
    var bgColor: Color
    var dear: String = "JS"
    var title: String = "뀰잠자는 법"
    var hashtag: String = "#뀰잠"
    var text: String = "안녕하세요. 뀰잠자는 법은 뀰먹고 자세요 ㅋㅋ"
    @State var commentText: String = ""
    
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 d일 a h:mm"
        return dateFormatter.string(from: Date())
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.leading)
            
            Text(text)
                .padding()
            
            Spacer()
            
            Text("Dear \(dear)")
                .padding()
            Text(hashtag)
                .padding()
            
            HStack {
                TextField("", text: $commentText)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading)
                Button {
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                        .padding(5)
                }
            }
            .padding()
        }
    }
}

#Preview {
        StarDetailView(bgColor: Color(.BG))
}
