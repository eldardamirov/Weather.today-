//
//  statusMenuController.swift
//  Weather.today!
//
//  Created by Эльдар Дамиров on 09.05.2018.
//  Copyright © 2018 Эльдар Дамиров. All rights reserved.
//

import Cocoa

class statusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!;
    let statusItem = NSStatusBar.system.statusItem ( withLength: NSStatusItem.variableLength );
    
    
    @IBAction func quitButtonClicked(_ sender: NSMenuItem) 
        {
        NSApplication.shared.terminate ( self );
        }

        
    override func awakeFromNib() 
        {
        // Insert code here to initialize your application
        
        let icon = NSImage ( named: NSImage.Name ( rawValue: "statusIcon" ) );
        icon?.isTemplate = true;
        statusItem.image = icon;
        
        statusItem.menu = statusMenu;
        }

    
}
