//
//  Place.swift
//  RideShare
//
//  Created by DREAMWORLD on 27/12/24.
//

import Foundation
import SwiftUI

struct Place: Hashable {
    let name: String
    let address: String
    let distance: Double
}

let arrRecentPlace = [
    Place(name: "Office", address: "2972 Westheimer Rd. Santa Ana, Illinois 85486", distance: 2.7),
    Place(name: "Coffee shop", address: "1901 Thornridge Cir. Shiloh, Hawaii 81063", distance: 1.1),
    Place(name: "Shopping center", address: "4140 Parker Rd. Allentown, New Mexico 31134", distance: 4.9),
    Place(name: "Shopping mall", address: "4140 Parker Rd. Allentown, New Mexico 31134", distance: 4.0)
]
