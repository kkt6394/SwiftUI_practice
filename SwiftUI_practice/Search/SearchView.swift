//
//  SearchView.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 4/1/26.
//

import SwiftUI

struct SearchView: View {
    
    @State private var isAnimated = false
    
    @State private var money: [Money] = dummy
    
    @State private var searchText = ""
    
    var filterList: [Money] {
        return searchText.isEmpty ? money : money.filter {
            $0.product.contains(searchText)
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(0..<5) { _ in
                            bannerView()
                                .padding()
                                .containerRelativeFrame(.horizontal)
                                
                        }
                        
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .frame(height: 150)
                LazyVStack {
                    // id: render까지 영향을 미침.(고유해야 중복방지)
                    ForEach(filterList, id: \.self) { item in
                        listView(item)
                    }
                }
            }
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer,
                prompt: "내역을 검색해보세요"
            )
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "star.fill")
                        .buttonWrapper {
                            print("버튼 클릭")
                            let data = Money(
                                amount: .random(in: 1...100),
                                product: "테스트",
                                category: .deposit
                            )
                            money.insert(data, at: 0)
                        }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "heart.fill")
                        .buttonWrapper {
                            money.remove(at: 0)
                        }
                }
            }
            .navigationTitle("title")
            
        }
    }
    
    func animationExample() -> some View {
        
        VStack {
            toptitle()
            Text("Animation On")
                .buttonWrapper {
                    print("ON")
                    withAnimation(.bouncy) {
                        isAnimated = true
                    }
                }
            Text("Animation Off")
                .buttonWrapper {
                    print("OFF")
                    withAnimation(.bouncy) {
                        isAnimated = false
                    }
                }
        }
        
    }
    
    func toptitle() -> some View {
        Text("Jack Wallet")
            .font(.largeTitle)
            .bold()
            .frame(maxWidth: .infinity, alignment: isAnimated ? .leading : .center)
            .overlay(alignment: .trailing) {
                topOverlayButton()
            }
            .padding()
            .background(.yellow)
    }
    
    func topOverlayButton() -> some View {
        Image(systemName: "plus")
            .foregroundStyle(.white)
            .padding()
            .background(.black, in: Circle())
            .opacity(isAnimated ? 1 : 0)
            .rotationEffect(.degrees(isAnimated ? 225 : 45))
            .buttonWrapper {
                withAnimation {
                    isAnimated = false
                }
            }
    }
    
    func bannerView() -> some View {
        ZStack {
            Rectangle()
                .fill(Color.random())
                .overlay(alignment: .leading) {
                    Circle()
                        .fill(.white.opacity(0.3))
                        .scaleEffect(1.7)
                        .offset(x: 0, y: 30)
                }
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
            VStack(alignment: .leading) {
                Text("나의 소비내역")
                    .font(.callout)
                Text("532,234,556원")
                    .font(.title).bold()
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
    }
    
    func listView(_ item: Money) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.product)
                    .fontWeight(.bold)
                Text(item.category.rawValue)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(item.amountFormat)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
    }
}

#Preview {
    SearchView()
}
