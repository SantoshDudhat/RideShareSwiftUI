//
//  FeatureRow.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import SwiftUI

struct FeatureRow: View {
    
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.custom(poppinsMedium, size: 14))
                .foregroundColor(Color.hex("5A5A5A"))
            Spacer()
            Text(value)
                .font(.custom(poppinsMedium, size: 14))
                .foregroundColor(Color.hex("5A5A5A"))
        }
        .padding()
        .background(themePrimaryLightGreenColor)
        .cornerRadius(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(themePrimaryGreenColor, lineWidth: 1)
        }
    }
}

#Preview {
    FeatureRow(label: "", value: "")
}
