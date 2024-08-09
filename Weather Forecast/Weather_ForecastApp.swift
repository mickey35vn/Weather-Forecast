//
//  Weather_ForecastApp.swift
//  Weather Forecast
//
//  Created by Tram Nguyen on 07/08/2024.
//

import SwiftUI

@main
struct Weather_ForecastApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(FavouriteCityViewModel())
        }
    }
}
