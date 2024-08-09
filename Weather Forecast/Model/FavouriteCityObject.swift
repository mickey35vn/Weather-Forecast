//
//  CityObject.swift
//  Weather Forecast
//
//  Created by Tram Nguyen on 09/08/2024.
//

import Foundation
import RealmSwift

class FavouriteCityObject: Object {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var code: Int
    @Persisted var name: String
}
