//
//  Country.swift
//  RideShare
//
//  Created by DREAMWORLD on 19/12/24.
//

import Foundation

struct Country: Codable, Hashable {
    let name, flag, code, dialCode: String
    enum CodingKeys: String, CodingKey {
        case name, flag, code
        case dialCode = "dial_code"
    }
    init(name: String, flag: String, code: String, dialCode: String) {
        self.name = name
        self.flag = flag
        self.code = code
        self.dialCode = dialCode
    }
}

// get the flag emoji with given country ISO code
func countryFlag(countryCode: String) -> String {
  return String(String.UnicodeScalarView(
     countryCode.unicodeScalars.compactMap({ UnicodeScalar(127397 + $0.value) })))
}

// load country list from json (placement of the json file doesn't matter if using xcode)
func getCountryList() -> [Country] {
    let url = Bundle.main.url(forResource: "countryCode", withExtension: "json")!
    let data = try! Data(contentsOf: url)
    let decoder = JSONDecoder()
    let products = try? decoder.decode([Country].self, from: data)
    return products!
}
