//
//  WeatherDetailView.swift
//  Weather Forecast
//
//  Created by Tram Nguyen on 09/08/2024.
//

import Foundation
import SwiftUI

struct WeatherView: View {
    
    @EnvironmentObject private var viewModel: WeatherViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var image: UIImage? = nil
    @State private var currentTime = Date()
    
    let searchText: String
    
    private var currentTimeString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM YYYY HH:mm:ss"
        return dateFormatter.string(from: currentTime)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.orange.ignoresSafeArea()
            VStack(alignment: .center, spacing: 0) {
                if self.viewModel.isLoading {
                    ProgressView()
                } else {
                    if let data = self.viewModel.weatherData {
                        HStack {
                            VStack(alignment: .leading, spacing: 0) {
                                Text(data.name)
                                    .font(.title)
                                Text(data.weather.first?.description ?? "")
                            }
                            if let image = image {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 128, height: 128)
                            }
                        }
                        HStack(alignment: .top, spacing: 24) {
                            Text("\(Int(data.main.feelsLike))°C").foregroundColor(Color.black)
                                .font(.system(size: 60).bold())
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Details").font(.subheadline.bold())
                                Divider()
                                HStack(alignment: .top, spacing: 24) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Feels like").font(.caption)
                                        Text("Wind").font(.caption)
                                        Text("Humidity").font(.caption)
                                        Text("Precip").font(.caption)
                                        Text("Presure").font(.caption)
                                    }
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("\(Int(data.main.feelsLike))°C").font(.caption)
                                        Text("\(Int(data.wind.speed)) m/s").font(.caption)
                                        Text("\(Int(data.main.humidity))%").font(.caption)
                                        Text("").font(.caption)
                                        Text("\(Int(data.main.pressure)) hPa").font(.caption)
                                    }
                                }
                            }
                        }
                        .padding(12)
                        .background(Color.white)
                        HStack {
                            Image(ImageResource.logo)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                            Spacer()
                            Text(currentTimeString).font(.caption)
                        }
                        .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
                    } else {
                        WeatherErrorView()
                    }
                }
            }
        }
        .background(Color.orange)
        .onAppear(perform: {
            Task {
                await self.viewModel.fetchWeatherData(query: searchText)
                
                if let icon = self.viewModel.weatherData?.weather.first?.icon, let imageURL = URL(string: "https://openweathermap.org/themes/openweathermap/assets/vendor/owm/img/widgets/\(icon).png") {
                    
                    let result = await NetworkManager.shared.downloadImage(from: imageURL, cacheEnabled: true)
                    
                    switch result {
                    case .success(let success):
                        self.image = success
                    case .failure(_):
                        self.image = nil
                    }
                }
            }
        })
    }
}

#Preview {
    WeatherView(searchText: "london").environmentObject(WeatherViewModel())
}
