//
//  PhotoView.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 3/31/26.
//

import SwiftUI

// LazyVStack(List) vs Stack
struct PhotoView: View {
    var body: some View {
        VStack {
            Text("asd")
            ScrollView {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(1..<100) { item in
                            Image(systemName: "star")
                                .buttonWrapper {
                                    print("asdasd")
                                }
                                .asBlackBGView()

                        }
                    }
                }
                LazyVStack {
                    ForEach(1..<100) { item in
                        Text("Jack \(item)")
                            .asBlackBGView()

                    }
                }
            }
            .font(.largeTitle)
        }
        

    }
}

#Preview {
    PhotoView()
}
