//
//  PaymentMethods.swift
//  RideShare
//
//  Created by DREAMWORLD on 24/12/24.
//

import Foundation
import SwiftUI

struct PaymentMethod {
    let iconName: String
    let title: String
    let subtitle: String
}

var arrPaymentMethod = [
    PaymentMethod(iconName: "ic_visa_card", title: "**** **** **** 8970", subtitle: "Expires: 12/26"),
    PaymentMethod(iconName: "ic_mastercard", title: "**** **** **** 8970", subtitle: "Expires: 12/26"),
    PaymentMethod(iconName: "ic_paypal", title: "mailaddress@mail.com", subtitle: "Expires: 12/26"),
    PaymentMethod(iconName: "ic_cash", title: "Cash", subtitle: "Expires: 12/26")
]

