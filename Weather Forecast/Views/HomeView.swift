//
//  ContentView.swift
//  Weather Forecast
//
//  Created by Tram Nguyen on 07/08/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText = ""
    @State private var isShowingDetailView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                FavouriteCityListView()
            }
            .navigationDestination(isPresented: $isShowingDetailView) {
                WeatherView(searchText: searchText).environmentObject(WeatherViewModel())
             }
            .navigationBarTitle("Weather Forecast", displayMode: .automatic)
        }
        .searchable(text: $searchText)
        .onSubmit(of: .search, runSearch)
    }
    
    func runSearch() {
        isShowingDetailView = true
    }
}

#Preview {
    HomeView().environmentObject(FavouriteCityViewModel())
}
