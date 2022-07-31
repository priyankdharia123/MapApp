//
//  MapAppApp.swift
//  MapApp
//
//  Created by Priyank Dharia on 7/26/22.
//

import SwiftUI

@main
struct MapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
