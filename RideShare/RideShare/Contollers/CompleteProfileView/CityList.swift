//
//  CityList.swift
//  RideShare
//
//  Created by DREAMWORLD on 20/12/24.
//

import SwiftUI

struct CityList: View {
    @State private var searchText: String = ""
    @Binding var showModal: Bool
    @Binding var selectedCity: City?
    var body: some View {
        VStack {
            SearchBar(text: $searchText, placeholder: "Search")
            List {
                // filter elements from the loaded array according to searchBar value
                ForEach(getCityList().filter {
                    self.searchText.isEmpty ? true : $0.city?.lowercased().contains(self.searchText.lowercased()) ?? false
                }, id: \.self) {item in
                    Button(action: {
                        // selection handle, changes values and closes the modal
                        selectedCity = item
                        showModal = false
                    }) {
                        // Display elements in list
                        Text("\(item.city ?? "")")
                            .font(Font.custom(poppinsRegular, size: 16))
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct CitySelector: View {
    @State var showModal: Bool = false
    @State var currentCity: City?
    @State var isDistrict = false
    var body: some View {
        VStack {
            Button(action: { self.showModal.toggle() }) {
                HStack {
                    Text(currentCity?.city ?? (isDistrict ? "District" : "City"))
                        .padding(.leading, 16)
                        .font(Font.custom(poppinsMedium, size: 16))
                        .foregroundColor(currentCity == nil ? Color.hex("C5C5C7") : .black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .padding(.trailing, 16)
                        .foregroundColor(.black)
                }
            }.sheet(isPresented: $showModal) { CityList(showModal: $showModal,
                                                        selectedCity: $currentCity) }
        }
    }
}
