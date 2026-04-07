//
//  ContentView.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 3/30/26.
//

import SwiftUI

//body -> 연산 프로퍼티, View Protocol
//불투명 타입, Opaque Type, 역제네릭 타입 == some
// ==> Type Eraser 비슷하지만 다름.
//빌드 전에 body의 타입이 어떤 타입인지 명확하게 알고 있음.
//컴파일 전에 타입을 알고 있지만 일부러 명세를 안하고 숨김.

/*
 뷰를 매번 반환
 modifier가 여러개 있으면, 하나씩 적용됨.
 순서에 따라 뷰가 다르게 생길 수 있음.
 우선순위도 존재한다.
 */
struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("Mello")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding(3)
                .background(.black)
            Text("Mello")
                .font(.title)
                .foregroundStyle(.white)
                .padding(3)
                .background(.black)
            Text("Mello")
                .font(.title2)
                .foregroundStyle(.white)
                .padding(3)
                .background(.black)
            hello
            hello
            bye()
            PointView(text: "A")
            PointView(text: "B")
        }
    }
    let number = Int.random(in: 1...100)
    
    func bye() -> some View {
        Text("Mello")
            .font(.title3)
            .foregroundStyle(.yellow)
            .padding(3)
            .background(.red)
    }
    
    var hello: some View {
        Text(number >= 50 ? "50이상입니다" : "50미만입니다")
            .font(.title3)
            .foregroundStyle(.white)
            .padding(3)
            .background(.black)
    }
}

extension Color {
    static func random() -> Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1)
        )
    }
}

#Preview {
    ContentView()
}
