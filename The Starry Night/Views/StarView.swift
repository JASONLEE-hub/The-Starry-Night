//
//  StarView.swift
//  The Starry Night
//
//  Created by 이재승 on 12/8/23.
//

import SwiftUI

struct StarView: View {
    let starSize : StarSize
    var message: String = "Hello Star ㅇㅇㅇㅇㅇㅇ"
    var bgColor: Color = Color(.point)
    var size: Double {
        switch starSize {
        case .big :
            200
        case .normal :
            100
        case .small :
            50
        }
    }
    var fontSize: Font {
        switch starSize {
        case .big :
            Font.largeTitle
        case .normal :
            Font.title3
        case .small :
            Font.caption
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .frame(maxWidth: size + 30)
                .foregroundColor(.clear)
            Circle()
                .frame(maxWidth: size + 10)
                .foregroundStyle(bgColor)
                .blur(radius: 10)
            
            Circle()
                .frame(maxWidth: size)
                .foregroundStyle(bgColor)
                .overlay(Text(message)
                    .font(fontSize)
                    .bold()
                    .foregroundStyle(.white)
                    .lineLimit(1))
        }
    }
}

#Preview {
    StarView(starSize: .normal)
}
