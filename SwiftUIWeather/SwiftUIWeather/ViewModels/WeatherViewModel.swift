//
//  WeatherViewModel.swift
//  SwiftUIWeather
//
//  Created by Yago de Martin Lopez on 09/02/2021.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {

    private var provider: WeatherProvider!
    @Published  var weather: WeatherModel = WeatherModel()

    init() {
        
        self.provider = WeatherProvider()
    }
    
    var temperature: String {
        if let temp = self.weather.temp {
            return String(format: "%.0fº", temp)
        } else {
            return ""
        }
    }
    var icon: String {
        if let temp = self.weather.icon {
            print ("http://openweathermap.org/img/wn/\(temp)@2x.png")
            return ( "http://openweathermap.org/img/wn/\(temp)@2x.png")
            
        } else {
            return ""
        }
    }
    
    var cityName: String = ""
   
    private func fetchWeather(city: String) {
        
        self.provider.getLocalWeather(city: city, completion: { weather, icon  in
            if let weather = weather {
                //Always in the main thread
                DispatchQueue.main.async {
                    self.weather = weather
                    self.weather.icon = icon?.icon
                }
            }
            
        })
    }
    
    func search() {
        
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                       
            fetchWeather(city: city)
        }
        
    }
}
