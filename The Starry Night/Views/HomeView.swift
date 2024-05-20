//
//  HomeView.swift
//  The Starry Night
//
//  Created by 이재승 on 2023/11/11.
//

import SwiftUI

struct HomeView: View {
    @StateObject var starStore: StarStore = StarStore()
    @State private var category: Category = .todayStar
    @State private var isShowingDetailView: Bool = false
    @State private var tempStar: StarModel = StarModel.starDummy
    
    var body: some View {
        VStack {
            Picker("", selection: $category) {
                Text("오늘의 별").tag(Category.todayStar)
                Text("나의 별").tag(Category.myStar)
            }
            .pickerStyle(.segmented)
            Spacer()
            GeometryReader { geometry in
                if category == .todayStar {
                    ScrollView {
                        ForEach(starStore.stars.shuffled()) { star in
                            Button {
                                tempStar = star
                                isShowingDetailView = true
                            } label: {
                                StarView(starSize: StarSize.allCases.randomElement() ?? .normal, title: star.title)
                                    .position(x: CGFloat.random(in: 10...geometry.size.width - 30), y: CGFloat.random(in: 10...geometry.size.height) - 30)
                            }
                        }
                    }
                }
                
                else if category == .myStar {
                    
                }
            }
            
        }
        .onAppear {
            starStore.randomFetchStars(n: 15)
        }
        .refreshable {
            starStore.randomFetchStars(n: 15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("HomeBackground"))
        // animation에 value 무슨의미?
        .animation(.none, value: 0)
        .sheet(isPresented: $isShowingDetailView, content: {
            StarDetailView(star: tempStar)
        })
    }
}

#Preview {
    HomeView()
}
