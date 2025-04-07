//
//  Transport.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import Foundation
import SwiftUI

struct Transport: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct CarModel {
    let id = UUID()
    let name: String
    let carImage: String
    let type: String
    let seat: String
    let fuleType: String
    let distation: String
}

struct Specifications {
    let image: String
    let name: String
    let subTitle: String
}

var arrTransport = [
    Transport(name: "Car", imageName: "ic_car"),
    Transport(name: "Bike", imageName: "ic_bike"),
    Transport(name: "Cycle", imageName: "ic_cycle"),
    Transport(name: "Taxi", imageName: "ic_taxi")
]

var arrCarModel = [
    CarModel(name: "BMW Cabrio", carImage: "ic_bmw_cabrio", type: "Automatic", seat: "3 seats", fuleType: "Octane", distation: "800m (5mins away)"),
    CarModel(name: "Mustang Shelby GT", carImage: "ic_mustang_gt", type: "Automatic", seat: "3 seats", fuleType: "Octane", distation: "800m (5mins away)"),
    CarModel(name: "BMW 18", carImage: "ic_bmw_18", type: "Automatic", seat: "3 seats", fuleType: "Octane", distation: "800m (5mins away)"),
    CarModel(name: "Jaguar Silber", carImage: "ic_jaguar", type: "Automatic", seat: "3 seats", fuleType: "Octane", distation: "800m (5mins away)")
]

var arrSpecification = [
    Specifications(image: "ic_max_power", name: "Max. power", subTitle: "2500hp"),
    Specifications(image: "ic_fual", name: "Fuel", subTitle: "10km per litre"),
    Specifications(image: "ic_speed", name: "Max. speed", subTitle: "230kph"),
    Specifications(image: "ic_mph", name: "0-60mph", subTitle: "2.5sec")
]
