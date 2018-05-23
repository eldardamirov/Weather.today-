//
//  WeatherView.swift
//  Weather.today!
//
//  Created by Эльдар Дамиров on 10.05.2018.
//  Copyright © 2018 Эльдар Дамиров. All rights reserved.
//

import Cocoa

class WeatherView: NSView 
    {
//    override func awakeFromNib() 
//        {
//
//        }
        
//     @IBOutlet weak var cityLabel: NSTextField!;
//     @IBOutlet weak var temperatureLabel: NSTextField!;
//     @IBOutlet weak var conditionsLabel: NSTextField!;
    @IBOutlet weak var temperatureLabel: NSTextField!;
    @IBOutlet weak var stateLabel: NSTextField!;
    @IBOutlet weak var stateImage: NSImageView!;
    
    public func updateWeather ( weather data: Weather, icon stateImage: NSImage )
        {
//        temperatureLabel.setValue ( String ( data.currentTemp ), forKey:  );

//        stateLabel.setValue ( String ( data.conditions ), forKey: .bold );
        temperatureLabel?.stringValue = String ( data.currentTemp );
        stateLabel?.stringValue = String ( data.conditions );
        
        DispatchQueue.main.async 
            {
            self.stateImage?.image = stateImage;
            
            self.temperatureLabel?.stringValue = "\( Int ( data.currentTemp ) )°C";
            self.stateLabel?.stringValue =  "\( data.conditions )";
            }
        
//        let currentConditions = data.conditions;
//        print ( "Yes: \( currentConditions )" );
//        switch currentConditions 
//            {
//            case "Sunny":
//                stateImage.image = #imageLiteral(resourceName: "sun");
//                
////            case "Cloudy", "Partly cloudy":
////            
////            case "Mist":
////            
////            case "Patchy rain possible":
////                
//            
//            default:
//                stateImage.image = #imageLiteral(resourceName: "default");
//            
//            }
//        }
    
    //    public func updateWeather ( city inputCity: String = "Moscow", temp inputTemp: Float = 0.0, conditions inputConditions: String = "Sunny" )
//        {
//        
//        cityLabel.stringValue = inputCity;
//        temperatureLabel.stringValue = String ( inputTemp );
//        conditionsLabel.stringValue = inputConditions;
////        cityLabel.setValue( inputCity, forKey:  )
////        cityLabel.setValue(<#T##value: Any?##Any?#>, forKey: <#T##String#>)
//        
//        }
    
        }
    }
