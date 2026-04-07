//
//  TamagochiUpgradeView.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 4/2/26.
//

import SwiftUI
import Combine

struct TamagochiUpgradeView: View {
    // State가 바뀌면 body가 렌더링된다.
    // ViewModel의 Published가 바뀌면 신호를 받는게 StateObject
    @StateObject var viewModel = TamagochiViewModel()
    
    var body: some View {
        VStack {
            Text("밥알 \(viewModel.output.rice), 물방울: \(viewModel.output.water)")
            HStack {
                TextField("밥알 입력", text: $viewModel.input.riceField)
                Button("밥알") {
                    viewModel.action(.addRice)
                    print("밥알클릭")
                }
            }
            HStack {
                TextField("물방울 입력", text: $viewModel.input.waterField)
                Button("물방울") {
                    viewModel.action(.addWater)
                }
            }
        }
    }
}
/*
 @State
 - View의 SOT
 @State -> body -> View
 ViewModel은 View가 아님 -> @State가 아닌 다른 키워드가 필요
 어떤 키워드인지 몰라도, rice -> ViewModel -> View의 Body
 @Published: 프로퍼티 데이터가 변경될 때 뷰가 업데이트 되도록 도와주는 키워드
 */
class TamagochiViewModel: ObservableObject {

    var input = Input()
    
    @Published var output = Output()
    
    struct Input {
        let riceButtonTapped = PassthroughSubject<Void, Never>()
        let waterButtonTapped = PassthroughSubject<Void, Never>()
        var riceField = ""
        var waterField = ""
    }
    
    struct Output {
        var rice = 0
        var water = 0
    }
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        transform()
    }
    
    func transform() {
        input.riceButtonTapped
            .sink { _ in
                self.addRice()
            }
            .store(in: &cancellables)
        
        input.waterButtonTapped
            .sink { _ in
                self.addWater()
            }
            .store(in: &cancellables)
    }
    
    private func addRice() {
        if let count = Int(input.riceField) {
            output.rice += count
        } else {
            output.rice += 1
        }
    }
    
    private func addWater() {
        if let count = Int(input.waterField) {
            output.water += count
        } else {
            output.water += 1
        }
    }
}

extension TamagochiViewModel {
    
    enum Action {
        case addRice
        case addWater
    }
    
    func action(_ action: Action) {
        switch action {
        case .addRice:
            input.riceButtonTapped.send(())

        case .addWater:
            input.waterButtonTapped.send(())

        }
    }
}

#Preview {
    TamagochiUpgradeView()
}
