//
//  ContentView.swift
//  AppLock
//
//  Created by Azhagusundaram Tamil on 20/01/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appLockVM: AppLockViewModel
    
    var body: some View {
        ZStack {
            if !appLockVM.isAppLockEnabled || appLockVM.isAppUnLocked {
                AppHomeView()
            } else {
                AppLockView()
            }
        }
        .onAppear {
            if appLockVM.isAppLockEnabled {
                appLockVM.appLockValidation()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
