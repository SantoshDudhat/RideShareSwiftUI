//
//  CellHistory.swift
//  RideShare
//
//  Created by DREAMWORLD on 24/12/24.
//

import SwiftUI

struct CellHistory: View {
    var objTransaction: Transactions?
    var selectedOption: HistorySection = .upcoming

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(objTransaction?.name ?? "")
                        .font(Font.custom(poppinsMedium, size: 16))
                        .foregroundColor(.black)
                    Text(objTransaction?.amount ?? "")
                        .font(Font.custom(poppinsMedium, size: 12))
                        .foregroundColor(textFieldGrayBoarder)
                }
                Spacer()
                Text(selectedOption == .upcoming ? objTransaction?.date ?? "" : selectedOption == .completed ? "Done" : "Cancel")
                    .font(Font.custom(poppinsMedium, size: 14))
                    .foregroundColor(selectedOption == .upcoming ? .black : selectedOption == .completed ? themePrimaryGreenColor : Color.hex("D32F2F"))
            }
            .padding()
        }
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .foregroundColor(themeGreenColor)
        }
    }
}

#Preview {
    CellHistory(objTransaction: Transactions(name: "Wafaoner", date: "Today at 9:20 am", amount: "Mustang Shelby GT", isReceived: false))
}

