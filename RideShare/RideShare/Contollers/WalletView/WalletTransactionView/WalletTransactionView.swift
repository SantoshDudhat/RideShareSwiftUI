//
//  WalletTransactionView.swift
//  RideShare
//
//  Created by DREAMWORLD on 23/12/24.
//

import SwiftUI

struct Transactions {
    var id = UUID()
    var name: String
    var date: String
    var amount: String
    var isReceived: Bool
}

struct WalletTransactionView: View {
    var objTransaction: Transactions?

    var body: some View {
        VStack {
            HStack {
                Image(objTransaction?.isReceived == true ? "ic_receive_money" : "ic_send_money")
                VStack(alignment: .leading) {
                    Text(objTransaction?.name ?? "")
                        .font(Font.custom(poppinsMedium, size: 16))
                        .foregroundColor(.black)
                    Text(objTransaction?.date ?? "")
                        .font(Font.custom(poppinsMedium, size: 12))
                        .foregroundColor(textFieldGrayBoarder)
                }
                Spacer()
                Text(objTransaction?.amount ?? "")
                    .font(Font.custom(poppinsMedium, size: 14))
                    .foregroundColor(.black)
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
    WalletTransactionView(objTransaction: Transactions(name: "Wafaoner", date: "Today at 9:20 am", amount: "-$789.00", isReceived: false))
}
