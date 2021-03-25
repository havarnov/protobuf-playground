//
//  protobuf_playgroundApp.swift
//  protobuf-playground
//
//  Created by Håvar Nøvik on 25/03/2021.
//

import SwiftUI

@main
struct protobuf_playgroundApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
