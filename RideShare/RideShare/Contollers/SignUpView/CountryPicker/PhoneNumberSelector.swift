//
//  PhoneNumberSelector.swift
//  Country code picker
//
//  Created by Shadesun on 27/11/2021.
//

import SwiftUI

struct PhoneNumberSelector: View {
    @State var showModal: Bool = false
    @State var currentCountry: Country?
    @Binding var currentCode: String
    var body: some View {
        VStack {
            Button(action: { self.showModal.toggle() }) {
                HStack {
                    Text("\(countryFlag(countryCode: currentCountry?.code ?? "US"))")
                    Image(systemName: "chevron.down")
                }
            }.sheet(isPresented: $showModal) { FlagList(showModal: $showModal,
                                                        selectedCountry: $currentCountry, selectedCode: $currentCode) }
        }
    }
}
