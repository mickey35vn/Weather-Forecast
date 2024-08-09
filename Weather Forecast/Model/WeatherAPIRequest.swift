//
//  WeatherAPIRequest.swift
//  Weather Forecast
//
//  Created by Tram Nguyen on 08/08/2024.
//

import Foundation

struct WeatherAPIRequest: NetworkRequest {
    
    let query: String
        
    init(query: String) {
        self.query = query
    }
    
    var url: URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather")
    }
    var method: HTTPMethod {
        return .get
    }
    var headers: [HTTPHeader: String]? {
        return [.contentType: ContentType.json.rawValue]
    }
    var parameters: Encodable? {
        return WeatherParameters(q: query, appid: "<inbox me>", units: "metric")
    }
}

struct WeatherParameters: Encodable {
    let q: String
    let appid: String
    let units: String
}
