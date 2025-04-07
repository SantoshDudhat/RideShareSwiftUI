//
//  TabbarView.swift
//  RideShare
//
//  Created by DREAMWORLD on 20/12/24.
//

import SwiftUI

struct TabbarView: View {
    
    @State var selectedTab: Tab = .home
    @State private var isSideMenuOpen = false
    @State var isDriverInfoOpen = false
    @State var detail: CarModel?
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    
                    Group {
                        switch selectedTab {
                        case .home: HomeView(isSideMenuOpen: $isSideMenuOpen, isDriverInfoOpen: isDriverInfoOpen, detail: detail)
                        case .favourite: FavouriteView(isSideMenuOpen: $isSideMenuOpen)
                        case .offer: OfferView(isSideMenuOpen: $isSideMenuOpen)
                        case .profile: ProfileView(isSideMenuOpen: $isSideMenuOpen)
                        case .wallet: WalletView(isSideMenuOpen: $isSideMenuOpen)
                        }
                    }
                    
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        HStack {
                            Spacer()
                            
                            TabbarItem(selected: $selectedTab, tab: .home, width: 45, height: 30)
                            
                            Spacer()
                            
                            TabbarItem(selected: $selectedTab, tab: .favourite, width: 45, height: 30)
                            
                            Spacer()
                            
                            ZStack {
                                VStack {
                                    Image("ic_wallet")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.white)
                                        .shadow(radius: 5)
                                    Spacer()
                                    Text("Wallet")
                                        .font(Font.custom(poppinsRegular, size: 14))
                                }
                                .padding(.horizontal, -4)
                                .foregroundColor(selectedTab == .wallet ? themeGreenColor : .black)
                            }
                            .offset(y: -UIScreen.main.bounds.size.height / 9.5 / 2)
                            .onTapGesture {
                                selectedTab = .wallet
                            }
                            
                            Spacer()
                            
                            TabbarItem(selected: $selectedTab, tab: .offer, width: 45, height: 30)
                            
                            Spacer()
                            
                            TabbarItem(selected: $selectedTab, tab: .profile, width: 45, height: 30)
                            
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height / 9)
                        .background(Color(UIColor.white).cornerRadius(30, corners: [.topLeft, .topRight]))
                    }
                    .background(Color.clear)
                    .padding(.bottom, 0)
                }
                .ignoresSafeArea(edges: .bottom)
                
                if isSideMenuOpen {
                    SideMenuView(isMenuOpen: $isSideMenuOpen)
                        .background(Color.clear)
//                        .transition(.move(edge: .leading))
                        .zIndex(1) // Ensure the menu appears above the content
                }
            }
//            .animation(.smooth, value: isSideMenuOpen)
            .navigationBarHidden(true)
            .ignoresSafeArea(edges: .all)
            
        }
    }
}


#Preview {
    TabbarView(detail: CarModel(name: "BMW Cabrio", carImage: "ic_bmw_cabrio", type: "Automatic", seat: "3 seats", fuleType: "Octane", distation: "800m (5mins away)"))
}
