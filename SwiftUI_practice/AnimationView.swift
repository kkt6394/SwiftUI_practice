//
//  AnimationView.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 4/2/26.
//

import SwiftUI

struct CardModel: Hashable {
    let color = Color.random()
    let name: String
    let number: Int
}

struct AnimationView: View {
    
    @State private var isExpandable = false
    @State private var showDetail = false
    @State private var currentCard = CardModel(name: "", number: 0)
    
    @Namespace var animation
    
    var cardlist = [
        CardModel(name: "신한카드", number: 0),
        CardModel(name: "우리카드", number: 1),
        CardModel(name: "국민카드", number: 2),
        CardModel(name: "대구카드", number: 3),
        CardModel(name: "카카오카드", number: 4)
    ]
    
    var body: some View {
        VStack {
            topTitle()
            cardSpace()
            Spacer()
            Button("Animation ON") {
                withAnimation(.bouncy) {
                    isExpandable = true
                }
            }
            Button("Animation OFF") {
                withAnimation(.bouncy) {
                    isExpandable = false
                }
            }
        }
        .overlay {
            if showDetail {
                DetailAnimationView(
                    showDetail: $showDetail,
                    animation: animation,
                    currentCard: currentCard)
            }
        }
    }
    
    func cardSpace() -> some View {
        ScrollView {
            ForEach(cardlist, id: \.self) { item in
                cardView(item)
            }
        }
        .overlay {
            Rectangle()
                .fill(.black.opacity(isExpandable ? 0 : 0.01))
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        isExpandable = true
                    }
                }
        }
    }
    //1. 카드 선택 시 디테일 뷰로 넘어가는 기능 (탭)
    //2. 카드가 접혀있을 때 펼쳐주는 기능 (탭)
    
    func cardView(_ card: CardModel) -> some View {
        
        RoundedRectangle(cornerRadius: 25)
            .fill(card.color)
            .frame(height: 130)
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .offset(y: CGFloat(card.number) * (isExpandable ? 0 : -100))
            .matchedGeometryEffect(id: card,
                                   in: animation)
            .onTapGesture {
                currentCard = card
                withAnimation(.easeInOut) {
                    showDetail = true
                }
            }
    }
    
    func topTitle() -> some View {
        Text("Hello World")
            .font(.largeTitle)
            .bold()
            .frame(
                maxWidth: .infinity,
                alignment: isExpandable ? .leading : .center
            )
            .overlay(alignment: .trailing) {
                topOverlayButton()
            }
            .padding()
    }
    
    func topOverlayButton() -> some View {
        Button {
            withAnimation(.bouncy) {
                isExpandable = false
            }
        } label: {
            Image(systemName: "plus")
                .foregroundStyle(.white)
                .padding()
                .background(.black, in: Circle())
        }
        .rotationEffect(
            .degrees(isExpandable ? 225 : 45))
        .opacity(isExpandable ? 1 : 0)
    }
}

struct DetailAnimationView: View {
    
    @Binding var showDetail: Bool
    
    let animation: Namespace.ID
    
    let currentCard: CardModel
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(currentCard.color)
                    .frame(height: 130)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .matchedGeometryEffect(id: currentCard, in: animation)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            showDetail = false
                        }
                    }
            }
        }
    }
}

#Preview {
    AnimationView()
}
