//
//  FlagList.swift
//  Country code picker
//
//  Created by Shadesun on 27/11/2021.
//

import SwiftUI

struct FlagList: View {
    @State private var searchText: String = ""
    @Binding var showModal: Bool
    @Binding var selectedCountry: Country?
    @Binding var selectedCode: String
    var body: some View {
        VStack {
            SearchBar(text: $searchText, placeholder: "Search")
            List {
                // filter elements from the loaded array according to searchBar value
                ForEach(getCountryList().filter {
                    self.searchText.isEmpty ? true : $0.name.lowercased().contains(self.searchText.lowercased()) ||
                        $0.dialCode.lowercased().contains(self.searchText.lowercased())
                }, id: \.self) {item in
                    Button(action: {
                        // selection handle, changes values and closes the modal
                        selectedCountry = item
                        selectedCode = item.dialCode
                        showModal = false
                    }) {
                        // Display elements in list
                        Text("\(countryFlag(countryCode: item.code)) \(item.name) : \(item.dialCode)")
                    }
                }
            }
        }
    }
}
