//
//  CellFavouriteView.swift
//  RideShare
//
//  Created by DREAMWORLD on 23/12/24.
//

import SwiftUI

struct CellFavouriteView: View {
    var title: String
    var address: String
    
    var body: some View {
        VStack {
            HStack {
                Image("ic_map_pin")
                VStack(alignment: .leading) {
                    Text(title)
                        .font(Font.custom(poppinsMedium, size: 16))
                        .foregroundColor(.black)
                    Text(address)
                        .font(Font.custom(poppinsMedium, size: 12))
                        .foregroundColor(textFieldGrayBoarder)
                }
                Spacer()
                Image("ic_delete")
            }
            .padding()
        }
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .foregroundColor(themeLightGreenColor)
        }
    }
}

#Preview {
    CellFavouriteView(title: "Office", address: "2972 Westheimer Rd. Santa Ana, Illinois 85486")
}
