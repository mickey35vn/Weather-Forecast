//
//  CityViewModel.swift
//  Weather Forecast
//
//  Created by Tram Nguyen on 09/08/2024.
//

import Foundation
import Combine
import RealmSwift

final class FavouriteCityViewModel: ObservableObject {
    
    @Published var cities: [FavouriteCity] = []
    
    private var token: NotificationToken?
    private var defaultCities = [
        FavouriteCity(code: 1566083, name: "Ho Chi Minh City"),
        FavouriteCity(code: 1581130, name: "Hanoi"),
        FavouriteCity(code: 1586203, name: "Can Tho"),
        FavouriteCity(code: 1562414, name: "Vung Tau")
    ]
    
    init() {
        saveDefaultCities()
        setupObserver()
    }

    deinit {
        token?.invalidate()
    }
    
    private func setupObserver() {
        do {
            let realm = try Realm()
            let results = realm.objects(FavouriteCityObject.self)

            token = results.observe({ [weak self] changes in
                self?.cities = results.map(FavouriteCity.init)
                    .sorted(by: { $0.name > $1.name })
            })
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func saveDefaultCities() {
        do {
            let realm = try Realm()
            let results = realm.objects(FavouriteCityObject.self)
            if results.count == 0 {
                try realm.write {
                    realm.add(defaultCities.map({ city in
                        FavouriteCityObject(value: [
                            "code": city.code,
                            "name": city.name
                        ])
                    }))
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
