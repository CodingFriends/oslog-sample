//
//  OSLog_SampleApp.swift
//  Shared
//
//  Created by Gabriel Reimers on 20.04.22.
//

import SwiftUI

@main
struct OSLog_SampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            #if os(macOS)
                .frame(minWidth: 500, maxWidth: .infinity, minHeight: 500, maxHeight: .infinity)
            #endif
        }
        
    }
}
