//
//  TamagochiView.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 3/31/26.
//

import SwiftUI

struct TamagochiView: View {
    //Data(SOT)의 상태(State)가 변경되면 body가 렌더된다.
    @State private var rice = 0
    @State private var water = 0
    
    @State private var riceText = "고래밥"
    var body: some View {
        VStack {
            IntroView(rice: $rice, water: water)
            // textField 자체가 하위뷰 -> 그래서 바인딩 $ 을 써야함.
            TextField("밥알 갯수를 입력해주세요", text: $riceText)
                .multilineTextAlignment(.center)
            Button("밥알 버튼") {
                rice += 1
            }
            Button("물방울 버튼") {
                water += 1
            }
        }
    }
}

struct IntroView: View {
    
    @Binding var rice: Int
    let water: Int
    
    var body: some View {
        VStack {
            Button("밥알 10개 한번에 먹이기") {
                rice += 10
            }
            Text("밥알: \(rice)개, 물방울: \(water)개")
                .foregroundStyle(.yellow)
                .font(.largeTitle)
                .padding()
                .background(.red)
        }
        .padding()
        .background(.green)
    }
    
}

#Preview {
    TamagochiView()
}
