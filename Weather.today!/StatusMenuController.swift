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
        
    func weatherDidUpdate ( _ weather: Weather ) 
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
        
    func initializeSubviews() 
        {
        UINib ( nibName: "WeatherView", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        }
        
    func updateWeather()
        {
        weatherAPI.getCurrentWeather ( city: "Moscow" ) { weather in
            if let weatherMenuItem = self.statusMenu.item ( withTitle: "Weather" ) 
                {
//                weatherMenuItem. = weather.description
//                getIcon ( conditions: weather.conditions );
//                self.weatherView.updateWeather ( weather: weather, icon: self.getIcon ( conditions: weather.conditions ) );
                self.weatherView.updateWeather ( weather: weather, icon: self.getIcon ( conditions: weather.conditions ) );
                weatherMenuItem.view = self.weatherView;
                }
            self.weatherView.updateWeather ( weather: weather, icon: self.getIcon ( conditions: weather.conditions ) );
            NSLog ( "Updated.\n" );
            print ( self.getIcon ( conditions: weather.conditions ) );
                
            };

//        weatherAPI.getCurrentWeather(city: "Moscow" , success: { weather in NSLog ( weather.description ) } );
        }
        
    func getIcon ( conditions currentConditions: String ) -> NSImage
        {
        let tempImage: NSImage!; //// !!!!!;
        
        
        print ( "Image: \( currentConditions )" );
        switch currentConditions 
            {
            case "Sunny":
                tempImage = #imageLiteral(resourceName: "sun");
                
//            case "Cloudy", "Partly cloudy":
//            
//            case "Mist":
//            
//            case "Patchy rain possible":
//                
            
            default:
                tempImage = #imageLiteral(resourceName: "default");
                print ( "Default" );
            
            }
            
        return tempImage;
        }
        
        

    
    }
