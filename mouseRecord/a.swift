//
//  a.swift
//  mouseRecord
//
//  Created by Iris on 12/28/23.
//

import Foundation
import Cocoa



class ExampleApplicationController: NSObject, NSApplicationDelegate {
    class ExampleController {
        
        let    window1    =    NSWindow()
        let    view1    =    NSView()
        
        init(){
            window1.setFrame(CGRect(x: 400, y: 0, width: 400, height: 500), display: true)
            window1.contentView                     =    view1
            
            window1.backgroundColor                 =    NSColor.clear
            window1.isOpaque                        =    false
            window1.styleMask                       =    [.borderless,.resizable]
            window1.isMovableByWindowBackground     =    true
            window1.makeKeyAndOrderFront(self)
            
            view1.wantsLayer                        =    true
            view1.layer!.cornerRadius               =    10
            view1.layer!.backgroundColor            =    CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            
            ///    :ref:    http://stackoverflow.com/questions/19940019/nswindow-with-round-corners-and-shadow/27613308#21247949
            window1.invalidateShadow()    //    This manual invalidation is REQUIRED because shadow generation is an expensive operation.
        }
    }
    
    let    example1    =    ExampleController()
}






