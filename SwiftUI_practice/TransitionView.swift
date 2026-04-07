//
//  TransitionView.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 3/31/26.
//

import SwiftUI

struct TransitionView: View {
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack {
                    ForEach(0..<10) { item in
                        NavigationLink {
                            LazyView {
                                CategoryView(number: item)
                            }
                            
                        } label: {
                            TransitionsDetailView()
                            // 클릭하지 않아도 인스턴스가 생성
                        }
                        
                    }
                }
                .navigationTitle("타이틀")
            }
            
        }
    }
}


struct TransitionsDetailView: View {
    var body: some View {
        HStack {
            Image(systemName: "star")
            VStack(alignment: .leading) {
                Text("장르")
                Text("테스트")
                TransitionThirdView()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(10)
    }
    
    init() {
        print("TransitionsDetialView Init")
    }
}

struct TransitionThirdView: View {
    var body: some View {
        Text("세번째 뷰")
    }
    
    init() {
        print("TransitionThirdView Init")
    }
}


#Preview {
    TransitionView()
}
