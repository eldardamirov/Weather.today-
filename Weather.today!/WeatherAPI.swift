//
//  WeatherAPI.swift
//  Weather.today!
//
//  Created by Эльдар Дамиров on 09.05.2018.
//  Copyright © 2018 Эльдар Дамиров. All rights reserved.
//

import Foundation

protocol WeatherAPIDelegate 
    {
    func weatherDidUpdate ( _ weather: Weather )
    }

struct Weather 
    {
    var city: String = "";
    var currentTemp: Float = 0.0;
    var conditions: String = "";
    
    var description: String 
        {
        return "Moscos: \( currentTemp )C˙; it is \( conditions )";
        }
    }

class WeatherAPI
    {
//    private let apiKey = "25470b2e160ea085d8833303e89c4dc3";
//    private let serverURL = "http://api.openweathermap.org/data/2.5/weather";
    private let apiKey = "03608f4ac58b4ced8d180237181005";
    private let serverURL = "https://api.apixu.com/v1/current.json?key=";
    
    private var delegate: WeatherAPIDelegate?;
    
    init ( delegate: WeatherAPIDelegate ) 
        {
        self.delegate = delegate;
        }
    
    public func getCurrentWeather ( city query: String, success: @escaping ( Weather ) -> Void )
        {
        let session = URLSession.shared;
        
        let escapedQuery = query.addingPercentEncoding ( withAllowedCharacters: CharacterSet.urlQueryAllowed );
        
//        let tempString = serverURL + "?APPID=" + apiKey + "&units=imperial&q=" + escapedQuery!;
        let tempString = serverURL + apiKey + "&q=" + query;
        
//        let url = URL ( string: "\( serverURL )?APPID=\( apiKey )&units=imperial&q=\( escapedQuery! )" );
        let url = URL ( string: tempString );
//        print ( "BBBBBBBBB" );
//        let temp = "https://api.apixu.com/v1/current.json?key=03608f4ac58b4ced8d180237181005&q=Moscow";
//        print ( "AAAAAAAAAAA \( url ) AAAAAAAAAAAA \( tempString.contains ( "\n" ) )" );
        
//        let task = session.dataTask ( with: url! ) { data, response, err in
        let task = session.dataTask ( with: url! ) { data, response, err in
            // first check for a hard error
            if let error = err 
                {
                NSLog("weather api error: \(error)")
                }
            
            
            // then check the response code
            if let httpResponse = response as? HTTPURLResponse 
                {
                
                switch httpResponse.statusCode 
                    {
                    case 200: // all good!
                        if let weather = self.parseJSON ( data: data! )
                            {
//                             NSLog ( "\( weather )" );
                            self.delegate?.weatherDidUpdate ( weather );
                            }
//                        if let dataString = String(data: data!, encoding: .utf8) 
//                            {
//                            NSLog(dataString)
//                            }

                    case 401: // unauthorized
                        NSLog ( "weather api returned an 'unauthorized' response. Did you set your API key?" )
                    default:
                        NSLog ( "weather api returned response: %d %@", httpResponse.statusCode, HTTPURLResponse.localizedString ( forStatusCode: httpResponse.statusCode ) )
                    }
                
                }


            }
         
        task.resume();    
        }
        
        
    public func parseJSON ( data inputData: Data ) -> Weather?
        {
        typealias JSONDict = [ String : AnyObject ];
        var json: JSONDict;
        
        do 
            {
            json = try JSONSerialization.jsonObject ( with: inputData, options: [] ) as! JSONDict
            } 
        catch 
            {
            NSLog ( "JSON parsing failed: \( error )" );
            return nil;
            }
        
        var weatherDict = json [ "current" ] as! JSONDict;
        var locationDict = json [ "location" ] as! JSONDict
        var conditionDict = weatherDict [ "condition" ] as! JSONDict;

        let weather = Weather (
                              city: locationDict [ "name" ] as! String,
                              currentTemp: weatherDict [ "temp_c" ] as! Float,
                              conditions: conditionDict [ "text" ] as! String
                              );

        return weather;
             
        }    
    
    
    }
