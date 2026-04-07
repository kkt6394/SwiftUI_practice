//
//  RenderingView.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 3/30/26.
//

import SwiftUI
/*
 매번 뷰가 그려짐.
 단, 구조체만 다시 안그려짐. PointView의 body 프로퍼티가 렌더링이 안되고 있음.
 -> 렌더링 비용 아끼려면 구조체로.
 -> 그럼에도, Init은 계속 되고, body는 렌더링하지 않는다.
 */
struct RenderingView: View {
    
    @State var age = 0
    
    var body: some View {
        VStack {
            Text("Hue")
                .background(Color.random())
            PointView(text: "Bran")
            jack()
            sesac
            Button("클릭: \(age)") {
                age = Int.random(in: 1...100)
            }
        }
    }
    
    func jack() -> some View {
        Text("Jack")
            .background(Color.random())
    }
    
    var sesac: some View {
        Text("sesac")
            .background(Color.random())

    }
    
}

#Preview {
    RenderingView()
}
