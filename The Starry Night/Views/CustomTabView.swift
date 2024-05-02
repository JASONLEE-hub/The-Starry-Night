//
//  ContentView.swift
//  The Starry Night
//
//  Created by 이재승 on 2023/11/11.
//

import SwiftUI

struct CustomTabView: View {
    
    @State var tabIndex: TabIndex
    
    @State var lagerScale : CGFloat = 1.4
    
    @ViewBuilder
    func changeView() -> some View {
        switch tabIndex {
        case .home:
            HomeView()
        case .add:
            AddView(tabIndex: $tabIndex)
        case .my:
            MypageView()
        }
    }
    
    func calCircleBGPosition(geometry: GeometryProxy) -> CGFloat {
        switch tabIndex {
        case .home:
            0
        case .add:
            geometry.size.width/3
        case .my:
            -(geometry.size.width/3)
        }
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack(alignment: .bottom) {
                    changeView()
                    
                    Circle()
                        .frame(width: 90, height: 90)
                        .offset(x: calCircleBGPosition(geometry: geometry), y: -4)
                        .foregroundStyle(.UI)
                    
                    // CustomTabbar
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Button {
                                withAnimation {
                                    tabIndex = .my
                                }
                            } label: {
                                Image(systemName: "person.fill")
                                    .offset(y: tabIndex == .my ? -10 : 0)
                                    .font(.system(size: 25))
                                    .scaleEffect(tabIndex == .my ? lagerScale : 1.0)
                                    .foregroundStyle(tabIndex == .my ? .white : .gray.opacity(0.8))
                                    .frame(width: geometry.size.width / 3, height: 50)
                                    .background(.UI)
                            }
                            Button {
                                withAnimation {
                                    tabIndex = .home
                                }
                            } label: {
                                Image(systemName: "moon.stars.fill")
                                    .offset(y: tabIndex == .home ? -10 : 0)
                                    .font(.system(size: 25))
                                    .scaleEffect(tabIndex == .home ? lagerScale : 1.0)
                                    .foregroundStyle(tabIndex == .home ? .white : .gray.opacity(0.8))
                                    .foregroundStyle(.white)
                                    .frame(width: geometry.size.width / 3, height: 50)
                                    .background(.UI)
                            }
                            Button {
                                withAnimation {
                                    tabIndex = .add
                                }
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .offset(y: tabIndex == .add ? -10 : 0)
                                    .font(.system(size: 25))
                                    .scaleEffect(tabIndex == .add ? lagerScale : 1.0)
                                    .foregroundStyle(tabIndex == .add ? .white : .gray.opacity(0.8))
                                    .foregroundStyle(.white)
                                    .frame(width: geometry.size.width / 3, height: 50)
                                    .background(.UI)
                            }
                        }
                        Rectangle()
                            .foregroundStyle(.UI)
                            .frame(height: 18)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}


#Preview {
    CustomTabView(tabIndex: .home)
}
