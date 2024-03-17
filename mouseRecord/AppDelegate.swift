//
//  a.swift
//  mouseRecord
//
//  Created by Iris on 12/28/23.
//

import AppKit
import Cocoa
import Foundation
import SwiftUI
// @main
class AppDelegate: NSObject, NSApplicationDelegate {
    var mouseTrackingTimer: Timer?
    var mousePositions: [RecordedMousePosition] = []

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let app = NSApplication.shared
        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 300, height: 200),
                              styleMask: [.borderless,.resizable,.titled,.fullSizeContentView],
                              backing: .buffered, defer: true)
        window.center()
        window.alphaValue = 0.1
        window.title = "Mouse Recorder"
        window.titleVisibility = .hidden
        window.standardWindowButton(.toolbarButton)
        window.titlebarAppearsTransparent = true
        window.contentView = NSHostingView(rootView: ContentView())
        window.contentViewController = ViewController()
        window.contentView?.wantsLayer = true
//        window.contentView?.layer?.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        window.contentView?.layer?.borderWidth = 1
//        window.contentView?.layer?.cornerRadius = 30
        window.contentView?.layer?.borderColor = NSColor.blue.cgColor
        window.contentView?.layer?.masksToBounds = true
        window.makeKeyAndOrderFront(nil)
        window.isMovableByWindowBackground = true

        app.activate(ignoringOtherApps: true)
    }
}
