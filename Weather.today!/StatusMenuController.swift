//
//  statusMenuController.swift
//  Weather.today!
//
//  Created by Эльдар Дамиров on 09.05.2018.
//  Copyright © 2018 Эльдар Дамиров. All rights reserved.
//

import Cocoa

class statusMenuController: NSObject, WeatherAPIDelegate 
    {
    
    @IBOutlet weak var statusMenu: NSMenu!;
    let statusItem = NSStatusBar.system.statusItem ( withLength: NSStatusItem.variableLength );
    
    var weatherAPI: WeatherAPI!;
    var weatherView = WeatherView();
    
    @IBAction func quitButtonClicked ( _ sender: NSMenuItem ) 
        {
        NSApplication.shared.terminate ( self );
        }

    @IBAction func updateButtonClicked ( _ sender: NSMenuItem )
        {
//        weatherAPI.getCurrentWeather ( city: "Moscow" );
//        weatherView.updateWeather ( city: "Moscow", temp: 10, conditions: "Sunny" );
        updateWeather();
        }
        
    func weatherDidUpdate(_ weather: Weather) 
        {
        NSLog ( weather.description );
        }   
    
        
    override func awakeFromNib() 
        {
        // Insert code here to initialize your application
        
        let icon = NSImage ( named: NSImage.Name ( rawValue: "statusIcon" ) );
        icon?.isTemplate = true;
        statusItem.image = icon;
        
        statusItem.menu = statusMenu;
        
        weatherAPI = WeatherAPI ( delegate: self );
        updateWeather();
        }
        
    func updateWeather()
        {
        weatherAPI.getCurrentWeather ( city: "Moscow" ) { weather in
//            if let weatherMenuItem = self.statusMenu.item ( withTitle: "Weather" ) 
//                {
//                weatherMenuItem.title = weather.description
//                getIcon ( conditions: weather.conditions );
//                }
            self.weatherView.updateWeather ( weather: weather, icon: self.getIcon ( conditions: weather.conditions ) );
                
            };

//        weatherAPI.getCurrentWeather(city: "Moscow" , success: { weather in NSLog ( weather.description ) } );
        }
        
    func getIcon ( conditions currentConditions: String ) -> NSImageView
        {
        let tempImage = NSImageView(); //// !!!!!;
        
        print ( "Image: \( currentConditions )" );
        switch currentConditions 
            {
            case "Sunny":
                tempImage.image = #imageLiteral(resourceName: "sun");
                
//            case "Cloudy", "Partly cloudy":
//            
//            case "Mist":
//            
//            case "Patchy rain possible":
//                
            
            default:
                tempImage.image = #imageLiteral(resourceName: "default");
            
            }
            
        return tempImage;
        }
        
        

    
    }
