//
//  WeatherErrorView.swift
//  Weather Forecast
//
//  Created by Tram Nguyen on 09/08/2024.
//

import Foundation
import SwiftUI

struct WeatherErrorView: View {
    var body: some View {
        VStack {
            Image(systemName: "rectangle.and.text.magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("Weather data not found")
        }
    }
}

#Preview {
    WeatherErrorView()
}
