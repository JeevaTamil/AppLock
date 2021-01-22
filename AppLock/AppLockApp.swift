//
//  AppLockApp.swift
//  AppLock
//
//  Created by Azhagusundaram Tamil on 20/01/21.
//

import SwiftUI

@main
struct AppLockApp: App {
    @StateObject var appLockVM = AppLockViewModel()
    @Environment(\.scenePhase) var scenePhase
    
    @State var blurRadius: CGFloat = 0
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appLockVM)
                .blur(radius: blurRadius)
                .onChange(of: scenePhase, perform: { value in
                    switch value {
                    case .active :
                        blurRadius = 0
                    case .background:
                        appLockVM.isAppUnLocked = false
                    case .inactive:
                        blurRadius = 5
                    @unknown default:
                        print("unknown")
                    }
                })
        }
    }
}
