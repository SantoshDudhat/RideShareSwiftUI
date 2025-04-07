//
//  Cities.swift
//  RideShare
//
//  Created by DREAMWORLD on 19/12/24.
//

import Foundation

struct City: Codable, Hashable {
    var city: String?
    var cityascii: String?
    var lat: Double?
    var lng: Double?
    var country: String?
    var iso2: String?
    var iso3: String?
    var adminName: String?
    var capital: String?
    var population: Int?
    var id: Int?

    enum CodingKeys: String, CodingKey {
        case city = "city"
        case cityascii = "city_ascii"
        case lat = "lat"
        case lng = "lng"
        case country = "country"
        case iso2 = "iso2"
        case iso3 = "iso3"
        case adminName = "admin_name"
        case capital = "capital"
        case population = "population"
        case id = "id"
    }
    
    init(city: String = "", cityascii: String = "", lat: Double = 0.0, lng: Double = 0.0, country: String = "", iso2: String = "", iso3: String = "", adminName: String = "", capital: String = "", population: Int = 0, id: Int = 0) {
        self.city = city
        self.cityascii = cityascii
        self.lat = lat
        self.lng = lng
        self.country = country
        self.iso2 = iso2
        self.iso3 = iso3
        self.adminName = adminName
        self.capital = capital
        self.population = population
        self.id = id
    }
}

// Function to load the city list from a JSON file
func getCityList() -> [City] {
    guard let url = Bundle.main.url(forResource: "worldcities", withExtension: "json") else {
        fatalError("Could not find worldcities.json in the bundle")
    }

    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let cities = try decoder.decode([City].self, from: data)
        return cities
    } catch {
        fatalError("Failed to decode cities.json: \(error)")
    }
}

// Example usage
func printCityData() {
    let cities = getCityList()
    for city in cities.prefix(5) { // Display the first 5 cities as a sample
        print("City: \(city.city ?? "Unknown"), Country: \(city.country ?? "Unknown"), Capital: \(city.capital ?? "Not specified")")
    }
}
