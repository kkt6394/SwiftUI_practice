//
//  PointView.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 3/30/26.
//

import SwiftUI

struct PointView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .foregroundStyle(.white)
            .padding(3)
            .background(Color.random())
    }
    init(text: String) {
        self.text = text
        print("PointView init") // 네트워크 통신구문
    }
}

#Preview {
    PointView(text: "Text")
}
