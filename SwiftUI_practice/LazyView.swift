//
//  LazyView.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 3/31/26.
//

import SwiftUI

struct LazyView<Content: View>: View {
    
    private let content: () -> Content
    
    var body: some View {
        content()
    }
    
    init(_ content: @escaping () -> Content) {
        self.content = content
        print("LazyView Init")
    }
}
