//
//  ContentView.swift
//  mouseRecord
//
//  Created by Iris on 12/28/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {

        VStack {
            Button(viewModel.recording ? "Stop Recording" : "Start Recording") {
                viewModel.toggleRecording()
            }
            .padding()
            Text("Recording Status: \(viewModel.recording ? "Recording" : "Not Recording")")
            Slider(value: $viewModel.sampleRate, in: 30 ... 180, step: 30)
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
            Text("Sample Rate: \(Int(viewModel.sampleRate)) Hz")
            Spacer()
        }

    }
}

#Preview {
    ContentView()
}

extension ContentView {
    var light: any View {
        Circle()
            .frame(width: 5, height: 5)
    }
}
