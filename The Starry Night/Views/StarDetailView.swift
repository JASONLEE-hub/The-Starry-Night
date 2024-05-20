//
//  StarDetailView.swift
//  The Starry Night
//
//  Created by 이재승 on 12/21/23.
//

import SwiftUI

struct StarDetailView: View {
    let star: StarModel
    @State var commentText: String = ""
    
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 d일 a h:mm"
        return dateFormatter.string(from: Date())
    }
    
    var body: some View {
        VStack {
            Text(star.title)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.leading)
            
            Text(star.text)
                .padding()
            
            Spacer()
            
            Text("Dear \(star.dear)")
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
    StarDetailView(star: StarModel(title: "Title", text: "Text", dear: "Dear", bgInt: 0))
}
