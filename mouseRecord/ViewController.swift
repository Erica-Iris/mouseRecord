//
//  ViewController.swift
//  mouseRecord
//
//  Created by Iris on 12/28/23.
//

import Cocoa
import Foundation

class ViewController: NSViewController {
    private lazy var redBox = NSView(frame: NSRect(x: 0, y: 0, width: 300, height: 300))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(redBox)
        redBox.wantsLayer=true
        redBox.layer?.backgroundColor=NSColor.red.cgColor
        redBox.layer?.cornerRadius=20
    }

    override func loadView() {
        view = NSView(frame: NSRect(x: 0, y: 0, width: NSScreen.main?.frame.width ?? 100, height: NSScreen.main?.visibleFrame.height ?? 100))
    }
}
