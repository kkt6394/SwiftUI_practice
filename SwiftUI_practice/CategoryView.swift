//
//  CategoryView.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 3/30/26.
//

import SwiftUI

// body 프로퍼티에서 변수를 수정하지 못하는 이유
// View Protocol - body 프로퍼티(nonmutating get) 꼭!
// SwiftUI 등장한 시기에 Swift 5.1 PropertyWrapper

//SOT, SSOT
struct CategoryView: View {
    
    let number: Int
    
    //@State 값이 변경되면 body 프로퍼티가 렌더링이 된다.
    // -> CategoryView 가 소유하는 데이터(private 으로 관리)
    @State private var genre = "액션"
    
    var body: some View {
        Text("값 전달 테스트: \(number)")
        VStack(
            alignment: .leading,
            spacing: 10) {
                HStack {
                    Button("SF") {
                        genre = "SF"
                    }
                    Button("액션") {
                        genre = "액션"
                    }
                    Button("스릴러") {
                        genre = "스릴러"
                    }
                }
                DetailView(genre: $genre)
            }
        
        
    }
    init(number: Int, genre: String = "액션") {
        self.number = number
        self.genre = genre
    }
    
}

struct DetailView: View {
    // 외부의 SOT를 전달받고 참조한다.
    // 상위뷰가 가진 State를 하위뷰에서 사용하고 "수정"할 수 있도록
    // Derived Value
    @Binding var genre: String
    var body: some View {
        VStack {
            Text("장르 선택: \(genre)")
            Button("장르 추천") {
                let list = ["SF", "스릴러", "액션"]
                genre = list.randomElement()!
            }
        }
        .background(.yellow)
    }
}

//#Preview {
//    CategoryView()
//}
