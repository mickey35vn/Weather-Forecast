# Weather Forecast

A simple Weather Forecast application that says "Hello" to the whole world!

# Description

This app will display weather information for a selected
city, fetched from a public API, and will allow users to save their favourite cities using a local
database.

# Getting started

<p>
1. Make sure you have the Xcode version 15.0 or above installed on your computer.<br>
2. Download the Weather Forecast project files from the repository.<br>
3. Install CocoaPods.<br>
4. Run pod install so you can install the dependencies in your project.<br>
5. Open the project files in Xcode.<br>
6. Review the code and make sure you understand what it does.<br>
7. Run the active scheme.<br>

# Screenshot

<div style="display: flex; justify-content: space-between;">
  <img src="./screenshot1.png" alt="Screenshot 1" width="48%">
  <img src="./screenshot2.png" alt="Screenshot 2" width="48%">
</div>

# Dependencies

[CocoaPods](https://cocoapods.org) is used as a dependency manager.
List of dependencies:

- pod 'RealmSwift' -> Realm is a mobile database that runs directly inside phones, tablets or wearables.

# API

- We are using a REST API
- List of API calls is [here](https://openweathermap.org/current)
- Use URLSession to make network
  requests to the OpenWeatherMap API.
- Parse JSON data using Codable
