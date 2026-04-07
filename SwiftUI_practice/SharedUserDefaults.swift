//
//  SharedUserDefaults.swift
//  SwiftUI_practice
//
//  Created by 김기태 on 4/6/26.
//

import Foundation

extension UserDefaults {
    
    static var groupShared: UserDefaults {
        let appID = "group.Aiden.widgetPractice"
        return UserDefaults(suiteName: appID)!
    }
    
}
