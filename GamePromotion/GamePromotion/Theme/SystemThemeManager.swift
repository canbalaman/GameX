//
//  SystemThemeManager.swift
//  GamePromotion
//
//  Created by Can Balaman on 2.01.2023.
//

import Foundation
import UIKit

class SystemThemeManager{
    
    static let shared = SystemThemeManager()
    private init () {
        
    }
    func handleTheme(darkMode:Bool,system: Bool){
        
        guard !system else {
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .unspecified
            return
        }
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = darkMode ? . dark : .light
    }
}
