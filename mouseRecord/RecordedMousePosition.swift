//
//  RecordedMousePosition.swift
//  mouseRecord
//
//  Created by Iris on 12/28/23.
//

import Foundation

struct RecordedMousePosition: Encodable {
    let timestamp: Date
    let point: CGPoint

    init(timestamp: Date, point: NSPoint) {
        self.timestamp = timestamp
        self.point = CGPoint(x: Double(point.x), y: Double(point.y))
    }
}
