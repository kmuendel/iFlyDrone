//
//  iFlyDroneApp.swift
//  iFlyDrone
//
//  Created by Kevin Mündel on 02.12.22.
//

import SwiftUI

@main
struct iFlyDroneApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vm:MainVM())
        }
    }
}
