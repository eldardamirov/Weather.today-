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
        
    @IBOutlet weak var cityLabel: NSTextField!;
    @IBOutlet weak var temperatureLabel: NSTextField!;
    @IBOutlet weak var conditionsLabel: NSTextField!;
    
    public func updateWeather ( city inputCity: String = "Moscow", temp inputTemp: Float = 0.0, conditions inputConditions: String = "Sunny" )
        {
        
        cityLabel.stringValue = inputCity;
        temperatureLabel.stringValue = String ( inputTemp );
        conditionsLabel.stringValue = inputConditions;
//        cityLabel.setValue( inputCity, forKey:  )
//        cityLabel.setValue(<#T##value: Any?##Any?#>, forKey: <#T##String#>)
        
        }
    
    }
