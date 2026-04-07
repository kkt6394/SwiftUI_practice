//
//  NumberView.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 4/2/26.
//

import SwiftUI
import Combine
import WidgetKit
/*
 @State
 @Binding
 @ObservedObject
 @StateObject
 
 @ObservedObject / @StateObject => iOS17 @Observable
 ObservedObject는 상위뷰에서 하위뷰로 전달하고 싶을 때.
 상위뷰가 렌더링 될때 초기화됨.
 @Published / ObservedObject
 
 */
struct NumberView: View {
    
    @State private var nicknameText = ""
    
    
    var body: some View {
        VStack {
            Text("NumberView")
            TextField(
                "닉네임을 입력해보세요",
                text: $nicknameText
                
            )
            Button("닉네임 저장") {
                print("저장되었습니다.")
                
                UserDefaults.groupShared.set(nicknameText, forKey: "nick")
                WidgetCenter.shared.reloadTimelines(ofKind: "BasicWidget")
//                WidgetCenter.shared.getCurrentConfigurations { widget in
//                    switch widget {
//                    case .success(let success):
//                        
//                    case .failure(let failure):
//                        
//                    }
//                }
                
            }
            ChildNumberView()
            
        }
        .onAppear {
            print("onAppear")
            print(UserDefaults.groupShared.string(forKey: "nick"))
        }
    }
}

struct ChildNumberView: View {
    // ObservedObject / StateObject
    @StateObject private var viewModel = ChildNumberViewModel()

    var body: some View {
        HStack {
            Text("숫자: \(viewModel.number)")
            Button("버튼 클릭") {
                viewModel.incrementCount()
            }
        }
    }
}

class ChildNumberViewModel: ObservableObject {
    
    @Published var number = 0

    func incrementCount() {
        number += 1
    }
}

#Preview {
    NumberView()
}
