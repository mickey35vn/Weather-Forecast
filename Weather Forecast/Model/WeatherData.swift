//
//  WeatherData.swift
//  Weather Forecast
//
//  Created by Tram Nguyen on 09/08/2024.
//

import Foundation

struct WeatherData: Decodable {
    let id: Int
    let name: String
    let base: String
    let timezone: Int
    let main: WeatherMain
    let coord: Coordinate
    let weather: [Weather]
    let visibility: Int
    let wind: WeatherWind
    let clouds: WeatherClouds
    let dt: Int
    let sys: WeatherSys
}

struct WeatherSys: Decodable {
    let id: Int?
    let type: Int?
    let country: String
    let sunrise: Int
    let sunset: Int
}

struct WeatherClouds: Decodable {
    let all: Int
}

struct WeatherWind: Decodable {
    let speed: Float
    let deg: Int
}

struct WeatherMain: Decodable {
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
    
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    let seaLevel: Int
    let grndLevel: Int
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
