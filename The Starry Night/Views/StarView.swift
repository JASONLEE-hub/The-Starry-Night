//
//  StarView.swift
//  The Starry Night
//
//  Created by 이재승 on 12/8/23.
//

import SwiftUI

struct StarView: View {
    let starSize : StarSize
    var title: String
    var bgColor: Color = Color(.white)
    var size: Double {
        switch starSize {
        case .big :
            200
        case .normal :
            100
        case .small :
            30
        case .littleSmall:
            50
        case .littleBig:
            150
        }
    }
    var fontSize: Font {
        switch starSize {
        case .big :
            Font.largeTitle
        case .normal :
            Font.title3
        case .small :
            Font.system(size: 5)
        case .littleSmall:
            Font.caption
        case .littleBig:
            Font.title2
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
                .overlay(Text(title)
                    .font(fontSize)
                    .bold()
                    .lineLimit(1))
        }
    }
}

#Preview {
    StarView(starSize: .normal, title: "TEST STAR")
}
