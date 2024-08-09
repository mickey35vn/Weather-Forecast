//
//  FavouriteCityListView.swift
//  Weather Forecast
//
//  Created by Tram Nguyen on 09/08/2024.
//

import Foundation
import SwiftUI

struct FavouriteCityListView: View {
    
    @EnvironmentObject private var viewModel: FavouriteCityViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack (alignment: .leading) {
                ForEach(viewModel.cities, id: \.id) { city in
                    NavigationLink (destination: WeatherView(searchText: city.name).environmentObject(WeatherViewModel())) {
                        FavouriteCityRowView(city: city)
                    }
                    Divider().padding(.leading, 20)
                }
            }
        }
    }
}
