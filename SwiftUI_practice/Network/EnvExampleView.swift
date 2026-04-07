//
//  EnvExampleView.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 4/7/26.
//

import SwiftUI
import Combine

class SettingModel: ObservableObject {
    
    @Published var isAlarmON = false

}

struct EnvExampleView: View {
    
    @StateObject private var setting = SettingModel()
    
    var body: some View {
        VStack {
            Text(setting.isAlarmON ? "알람 받기" : "알람 받지 않기")
            EnvFirstView()
        }
        .environmentObject(setting)
    }
}

struct EnvFirstView: View {
        
    var body: some View {
        Text("EnvFirstView")
        EnvSecondView()
    }
}

struct EnvSecondView: View {
    var body: some View {
        Text("EnvSecondView")
        EnvLastView()
    }
}

struct EnvLastView: View {
    
    @EnvironmentObject var setting: SettingModel
    
    var body: some View {
        Text("EnvLastView")
        Toggle("알림 설정", isOn: $setting.isAlarmON)

    }
}

#Preview {
    EnvExampleView()
}
