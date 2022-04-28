//
//  ContentView.swift
//  ViewModels
//
//  Created by Nguyen Quang Huy on 29/3/2022.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    let file: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("data.json", isDirectory: false)
    
    @StateObject var viewModel = TodoListViewModel(
        name: "My List",
        lists: []
    )
    
    var body: some View {
        VStack {
            if viewModel.isLoaded {
                TodoListView(viewModel: viewModel)
            } else {
                ProgressView()
            }
        }
        .onChange(of: scenePhase) { newPhase in
            switch newPhase {
            case .background, .inactive:
                viewModel.save(toFile: file)
            case .active:
                viewModel.load(fromFile: file)
            @unknown default:
                fatalError("Unhandled case")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
