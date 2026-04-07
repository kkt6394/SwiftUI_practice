//
//  BlackBGView.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 3/31/26.
//

import SwiftUI

private struct BlackBGView: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .padding(10)
            .background(.black)
            .border(.red, width: 4)
    }
}

extension View {
    func asBlackBGView() -> some View {
        modifier(BlackBGView())
    }
}
