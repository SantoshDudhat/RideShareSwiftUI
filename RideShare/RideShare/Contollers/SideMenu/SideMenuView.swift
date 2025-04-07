//
//  SideMenuView.swift
//  RideShare
//
//  Created by DREAMWORLD on 23/12/24.
//

import SwiftUI

struct MenuItem: Hashable {
    let icon: String
    let title: String
}

struct SideMenuView: View {
    @Binding var isMenuOpen: Bool
    @Environment(\.presentationMode) var presentationMode
    @State var selectedMenu: SideMenuOptions? = nil
    var body: some View {
        ZStack(alignment: .leading) {
            // Background overlay
            // Side menu
            HStack {
                VStack(alignment: .leading) {
                    // Profile Section
                    VStack {
                        HStack {
                            Button(action: {
                                withAnimation {
                                    isMenuOpen = false
                                }
                            }, label: {
                                HStack {
                                    Image(systemName: "chevron.backward")
                                        .foregroundColor(.black)
                                        .frame(width: 14)
                                    Text("Back")
                                        .font(Font.custom(poppinsRegular, size: 16))
                                        .foregroundColor(.black)
                                }
                            })
                            Spacer()
                        }

                        HStack {
                            Image("img_profile")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .overlay {
                                    Circle()
                                        .stroke(themeGreenColor, lineWidth: 1)
                                }
                            Spacer()
                        }
                        .padding(.top, 16)

                        HStack {
                            VStack(alignment: .leading) {
                                Text("Nate Samson")
                                    .font(Font.custom(poppinsMedium, size: 18))
                                    .foregroundColor(.black)
                                Text("nate@email.com")
                                    .font(Font.custom(poppinsMedium, size: 16))
                                    .foregroundColor(.black)
                            }
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
                    
                    // Menu Items
                    ForEach(menuItems, id: \.self) { item in
                        HStack {
                            Image(item.icon)
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text(item.title)
                                .font(Font.custom(poppinsMedium, size: 12))
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .navigationDestination(isPresented: .constant(selectedMenu == .history), destination: {
                            HistoryView()
                        })
                        .navigationDestination(isPresented: .constant(selectedMenu == .complain), destination: {
                            ComplainView()
                        })
                        .navigationDestination(isPresented: .constant(selectedMenu == .referral), destination: {
                            ReferralView()
                        })
                        .navigationDestination(isPresented: .constant(selectedMenu == .aboutUs), destination: {
                            AboutView()
                        })
                        .navigationDestination(isPresented: .constant(selectedMenu == .settings), destination: {
                            SettingView()
                        })
                        .navigationDestination(isPresented: .constant(selectedMenu == .helpAndSupport), destination: {
                            HelpAndSupportView()
                        })
                        .onTapGesture {
                            switch item.title {
                            case SideMenuOptions.history.key:
                                selectedMenu = .history
                            case SideMenuOptions.complain.key:
                                selectedMenu = .complain
                            case SideMenuOptions.referral.key:
                                selectedMenu = .referral
                            case SideMenuOptions.aboutUs.key:
                                selectedMenu = .aboutUs
                            case SideMenuOptions.settings.key:
                                selectedMenu = .settings
                            case SideMenuOptions.helpAndSupport.key:
                                selectedMenu = .helpAndSupport
                            case SideMenuOptions.logout.key:
                                selectedMenu = .logout
                            default:
                                break
                            }
                            print("\(item.title) tapped")
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top, 49)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.6) // Adjust as needed
                .background(
                    CustomCornerRadiusShape(radius: 70, corners: [.topRight, .bottomRight])
                        .fill(Color.white)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                )
                .ignoresSafeArea()
                Spacer() // Push menu to the left
            }
            
//            switch selectedMenu {
//            case .history:
//                HistoryView()
//                    .zIndex(1)
//            case .complain:
//                EmptyView()
//            case .referral:
//                EmptyView()
//            case .aboutUs:
//                EmptyView()
//            case .settings:
//                EmptyView()
//            case .helpAndSupport:
//                EmptyView()
//            case .logout:
//                EmptyView()
//            case .none:
//                EmptyView()
//            }
        }
        .onAppear(perform: {
            selectedMenu = nil
        })
        .background(.black.opacity(0.3))
        .navigationBarHidden(true)
    }
    
    // Menu data model
    var menuItems: [MenuItem] = [
        MenuItem(icon: SideMenuOptions.history.image, title: SideMenuOptions.history.key),
        MenuItem(icon: SideMenuOptions.complain.image, title: SideMenuOptions.complain.key),
        MenuItem(icon: SideMenuOptions.referral.image, title: SideMenuOptions.referral.key),
        MenuItem(icon: SideMenuOptions.aboutUs.image, title: SideMenuOptions.aboutUs.key),
        MenuItem(icon: SideMenuOptions.settings.image, title: SideMenuOptions.settings.key),
        MenuItem(icon: SideMenuOptions.helpAndSupport.image, title: SideMenuOptions.helpAndSupport.key),
        MenuItem(icon: SideMenuOptions.logout.image, title: SideMenuOptions.logout.key)
    ]
}

#Preview {
    SideMenuView(isMenuOpen: .constant(true))
}
