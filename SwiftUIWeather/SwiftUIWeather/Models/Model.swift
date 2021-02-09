//
//  Model.swift
//  SwiftUIWeather
//
//  Created by Yago de Martin Lopez on 09/02/2021.
//

import Foundation

struct WeatherModel: Decodable {
    var temp: Double?
    var humidity: Double?
    var icon: String?
}

struct IconModel: Decodable {
    var id: Double?
    var icon: String?
    var description: String?
}

struct WeatherResponse: Decodable {
    let main: WeatherModel
    let weather: [IconModel]
}
