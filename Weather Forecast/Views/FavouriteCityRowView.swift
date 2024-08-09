//
//  FavouriteCityRowView.swift
//  Weather Forecast
//
//  Created by Tram Nguyen on 09/08/2024.
//

import Foundation
import SwiftUI

struct FavouriteCityRowView: View {
    
    let city: FavouriteCity
    
    var body: some View {
        HStack(spacing: 8) {
            Text(city.name)
                .foregroundColor(.black)
            Spacer()
        }
        .padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
    }
}

#Preview {
    FavouriteCityRowView(city: FavouriteCity(cityObject: FavouriteCityObject(value: ["code": 1, "name": "Ho Chi Minh"])))
}
