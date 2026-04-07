//
//  FirstView.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 3/31/26.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationView {
            NavigationLink("클릭") {
                SecondView (
                    ThirdView()
                )
            }
            
        }
    }
}

struct SecondView<Content: View>: View {
    
    let content: () -> Content
    var body: some View {
        content()
    }
    
    init(_ content: @autoclosure @escaping () -> Content) {
        print("SecondView Init")
        self.content = content
    }
}

struct ThirdView: View {
    var body: some View {
        Text("ThirdView")
    }
    
    init() {
        print("ThirdView Init 네트워크 통신")
    }
}

#Preview {
    FirstView()
}
