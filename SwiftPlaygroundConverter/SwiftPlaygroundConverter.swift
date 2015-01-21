//
//  SwiftPlaygroundConvert.swift
//
//  Created by WebosterBob on 12/27/14.
//  Copyright (c) 2014 ___SLIGHTECH___. All rights reserved.
//

import AppKit
import Foundation

var sharedPlugin: SwiftPlaygroundConvert?

class SwiftPlaygroundConvert: NSObject {
    var bundle: NSBundle
    let findfiles = findAllFiles.init()
    
    class func pluginDidLoad(bundle: NSBundle) {
        let appName = NSBundle.mainBundle().infoDictionary?["CFBundleName"] as? NSString
        if appName == "Xcode" {
            sharedPlugin = SwiftPlaygroundConvert(bundle: bundle)
        }
    }
    
    
    init(bundle: NSBundle) {
        self.bundle = bundle
        
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"poplistmenu:", name: nil, object: nil)
        createMenuItems()
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func createMenuItems() {
        var item = NSApp.mainMenu!!.itemWithTitle("File")
        if item != nil {
            var P2SMenuItem = NSMenuItem(title:"convert all playground files to swift", action:"doConvertP2S", keyEquivalent:"")
            P2SMenuItem.target = self
            item!.submenu!.addItem(NSMenuItem.separatorItem())
            item!.submenu!.addItem(P2SMenuItem)
            
            var S2PMenuItem = NSMenuItem(title: "convert all swift files to playground", action: "doConvertS2P", keyEquivalent: "")
            S2PMenuItem.target = self
            item!.submenu!.addItem(S2PMenuItem)
        }
    }
    
    func poplistmenu(notification: NSNotification) {
        //         NSLog(" Notification: %@", notification.name);
        //        (NSApp.mainWindow!?.contentView as NSView).dumpWithIndent("")
        
        //       if let iWindow = NSApp.mainWindow {
        //            iWindow?.contentView?.dumpWithIndent("")
        //        } else {
        //        }
        
        //        println(NSHomeDirectory())
        
        //        if notification.name == "NSMenuDidAddItemNotification" {
        //            NSLog("notification = %@", notification.name)
        //        } else {
        //        }
        
        findfiles.findAllFiles_swift()
    }
    
    func doConvertP2S() {
        NSLog("doConvertP2S")
    }
    
    func doConvertS2P() {
        NSLog("doConvertS2P")
    }
}

