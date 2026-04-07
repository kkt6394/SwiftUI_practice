//
//  ButtonWrapper.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 3/31/26.
//

import SwiftUI

private struct ButtonWrapper: ViewModifier {
    
    let action: () -> Void
    
    func body(content: Content) -> some View {
        Button(action: action) {
            content
        }

            
    }
}

extension View {
    func buttonWrapper(action: @escaping () -> Void) -> some View {
        modifier(ButtonWrapper(action: action))
    }
}
