//
//  FavouriteCity.swift
//  Weather Forecast
//
//  Created by Tram Nguyen on 09/08/2024.
//

import Foundation

struct FavouriteCity: Identifiable {
    let id: String
    let code: Int
    let name: String
    
    init(code: Int, name: String) {
        self.id = UUID().uuidString
        self.code = code
        self.name = name
    }
    
    init(cityObject: FavouriteCityObject) {
        self.id = cityObject.id.stringValue
        self.code = cityObject.code
        self.name = cityObject.name
    }
}
