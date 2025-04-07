//
//  TabbarEnum.swift
//  RideShare
//
//  Created by DREAMWORLD on 20/12/24.
//

import Foundation
import SwiftUI

enum Tab: String {
    case home = "Home"
    case favourite = "Favourite"
    case offer = "Offer"
    case profile = "Profile"
    case wallet = "Wallet"
    
    var image: String {
        switch self {
        case .home: return "ic_tabbar_home"
        case .favourite: return "ic_tabbar_heart"
        case .offer: return "ic_tabbar_offer"
        case .profile: return "ic_tabbar_profile"
        case .wallet: return "ic_wallet"
        }
    }
    
    var isSelectedImage: String {
        switch self {
        case .home: return "ic_selected_tabbar_house"
        case .favourite: return "ic_selected_tabbar_heart"
        case .offer: return "ic_selected_tabbar_offer"
        case .profile: return "ic_selected_tabbar_profile"
        case .wallet: return "ic_wallet"
        }
    }
}


enum Method: String {
    case transport = "Transport"
    case delivery = "Delivery"
}
