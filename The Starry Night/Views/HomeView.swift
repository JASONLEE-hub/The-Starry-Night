//
//  HomeView.swift
//  The Starry Night
//
//  Created by 이재승 on 2023/11/11.
//

import SwiftUI

enum StarSize {
    case small, normal, big
}

enum Category {
    case todayStar, myStar
}

struct HomeView: View {
    @State private var category: Category = .todayStar
    @State private var isShowingDetailView: Bool = false
    
    var body: some View {
        VStack {
            Picker("", selection: $category) {
                Text("오늘의 별").tag(Category.todayStar)
                Text("나의 별").tag(Category.myStar)
            }
            .pickerStyle(.segmented)
            Spacer()
            
            if category == .todayStar {
                ScrollView {
                    Button {
                        isShowingDetailView = true
                    } label: {
                        StarView(starSize: .big)
                    }
                }
            }
            
            else if category == .myStar {
                
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.BG))
        // animation에 value 무슨의미?
        .animation(.none, value: 0)
        .sheet(isPresented: $isShowingDetailView, content: {
            StarDetailView(bgColor: .BG)
        })
    }
}

#Preview {
    HomeView()
}
