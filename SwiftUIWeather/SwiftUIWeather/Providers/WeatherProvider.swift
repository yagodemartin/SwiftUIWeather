//
//  WeatherProvider.swift
//  SwiftUIWeather
//
//  Created by Yago de Martin Lopez on 09/02/2021.
//

import Foundation

class WeatherProvider {
    
    func 	getLocalWeather(city: String, completion: @escaping (WeatherModel? , IconModel?) -> ()) {
    
        guard let url = URL (string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=b58393e42ddceee3117a5248588af8df&units=metric") else {
            completion (nil, nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else  {
                completion (nil,nil)
                return
            }
           
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                
                let icon: IconModel = weatherResponse.weather[0]
                
                completion(weather , icon)
            } else {
                completion (nil,nil)
                return
                
            }
        }.resume()
        
    }
}
