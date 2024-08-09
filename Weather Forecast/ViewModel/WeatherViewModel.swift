//
//  WeatherViewModel.swift
//  Weather Forecast
//
//  Created by Tram Nguyen on 09/08/2024.
//

import Foundation
import Combine
import RealmSwift

final class WeatherViewModel: ObservableObject {
    
    @Published var weatherData: WeatherData? = nil
    @Published var isLoading: Bool = false
    
    func fetchWeatherData(query: String) async {
        await MainActor.run {
            isLoading = true
        }
        
        let request = WeatherAPIRequest(query: query)
        
        if #available(iOS 15.0, *) {
            do {
                let data: WeatherData = try await NetworkManager.shared.perform(request, decodeTo: WeatherData.self)
                await MainActor.run {
                    updateWeatherData(data: data)
                }
            } catch {
                print("Failed to fetch data: \(error)")
                await MainActor.run {
                    updateWeatherData(data: nil)
                }
            }
        } else {
            NetworkManager.shared.perform(request, decodeTo: WeatherData.self) { result in
                switch result {
                case .success(let data):
                    self.updateWeatherData(data: data)
                case .failure(let error):
                    print("Failed to fetch data: \(error)")
                    self.updateWeatherData(data: nil)
                }
            }
        }
    }
    
    private func updateWeatherData(data: WeatherData?) {
        isLoading = false
        weatherData = data
        
        if let data = data {
            addFavouriteCity(code: data.id, name: data.name)
        }
    }
    
    private func addFavouriteCity(code: Int, name: String) {
        if isExist(code: code) {
            print(name + " is exists in the local database")
            return;
        }
        
        let cityObject = FavouriteCityObject(value: [
            "code": code,
            "name": name
        ])
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(cityObject)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func isExist(code: Int) -> Bool {
        do {
            let realm = try Realm()
            let results = realm.objects(FavouriteCityObject.self).where { $0.code == code }
            return results.count > 0
        } catch let error {
            print(error.localizedDescription)
        }
        return false;
    }
}
