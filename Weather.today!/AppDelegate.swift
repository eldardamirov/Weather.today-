//
//  AppDelegate.swift
//  Weather.today!
//
//  Created by Эльдар Дамиров on 09.05.2018.
//  Copyright © 2018 Эльдар Дамиров. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var statusMenu: NSMenu!;
    let statusItem = NSStatusBar.system.statusItem ( withLength: NSStatusItem.variableLength );
    
    @IBAction func quitButtonClicked(_ sender: NSMenuItem) 
        {
        NSApplication.shared.terminate ( self );
        }
        
        
    func applicationDidFinishLaunching(_ aNotification: Notification) 
        {
        // Insert code here to initialize your application
        statusItem.title = "WeatherBar";
        statusItem.menu = statusMenu;
        }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

