//
//  ContentViewModel.swift
//  mouseRecord
//
//  Created by Iris on 12/28/23.
//

import Foundation
import AppKit

class ContentViewModel: ObservableObject {
    @Published var recording = false
    @Published var sampleRate: Double = 90

    private var mouseTrackingTimer: Timer?
    private var mousePositions: [RecordedMousePosition] = []
    private var recordingStartDate: Date?

    func toggleRecording() {
        if recording {
            stopRecording()
        } else {
            startRecording()
        }
    }

    private func startRecording() {
        recording = true
        recordingStartDate = Date()

        mouseTrackingTimer = Timer.scheduledTimer(withTimeInterval: 1.0 / sampleRate, repeats: true) { [self] _ in
            let mousePosition = NSEvent.mouseLocation
            let timestamp = Date()
            mousePositions.append(RecordedMousePosition(timestamp: timestamp, point: mousePosition))

            if let startDate = self.recordingStartDate,
               let interval = Calendar.current.dateComponents([.second], from: startDate, to: timestamp).second,
               interval % 30 == 0
            {
                self.saveMousePositionsToFile()
            }
        }
    }

    private func stopRecording() {
        recording = false
        mouseTrackingTimer?.invalidate()
        mouseTrackingTimer = nil

        saveMousePositionsToFile()
    }

    private func saveMousePositionsToFile() {
        guard !mousePositions.isEmpty, let startDate = recordingStartDate else { return }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd_HHmmss"
        let fileName = "MousePositions_\(dateFormatter.string(from: startDate)).json"

        do {
            let jsonData = try JSONEncoder().encode(mousePositions)
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentsDirectory.appendingPathComponent(fileName)
                try jsonData.write(to: fileURL)

                print("Mouse positions saved to file: \(fileURL)")
            }
        } catch {
            print("Error saving mouse positions:", error.localizedDescription)
        }

        mousePositions.removeAll()
    }
}
