//
//  FavouriteView.swift
//  RideShare
//
//  Created by DREAMWORLD on 20/12/24.
//

import SwiftUI
struct Favourite {
    var id = UUID()
    var title: String
    var adderess: String
}

struct FavouriteView: View {
    var favourites = [
        Favourite(title: "Office", adderess: "2972 Westheimer Santa Ana, Illinois 85486 "),
        Favourite(title: "Home", adderess: "2972 Westheimer Santa Ana, Illinois 85486 "),
        Favourite(title: "Office", adderess: "2972 Westheimer Santa Ana, Illinois 85486 "),
        Favourite(title: "House", adderess: "2972 Westheimer Santa Ana, Illinois 85486 "),
        Favourite(title: "Office", adderess: "2972 Westheimer Santa Ana, Illinois 85486 "),
        Favourite(title: "Home", adderess: "2972 Westheimer Santa Ana, Illinois 85486 "),
        Favourite(title: "Office", adderess: "2972 Westheimer Santa Ana, Illinois 85486 "),
        Favourite(title: "House", adderess: "2972 Westheimer Santa Ana, Illinois 85486 ")
    ]
    
    @Binding var isSideMenuOpen: Bool

    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        print("Menu button tapped")
                        withAnimation {
                            isSideMenuOpen.toggle()
                        }
                    }) {
                        Image("ic_menu")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .shadow(radius: 4)
                    }
                    .padding(.leading, 16)
                    Spacer()
                }
                Text("Favourite")
                    .foregroundColor(.black)
                    .font(.custom(poppinsMedium, size: 19))
            }
            List(favourites, id: \.id) { notification in
                CellFavouriteView(title: notification.title, address: notification.adderess)
                    .listRowSeparator(.hidden, edges: .all)
            }
            .scrollIndicators(.hidden)
            .padding(.top, 16)
            .listStyle(PlainListStyle())
            .background(.white)
            Spacer()
        }
        .padding(.top, 44)
        .padding(.bottom, UIScreen.main.bounds.height / 9 / 1.3)
    }
}

#Preview {
    FavouriteView(isSideMenuOpen: .constant(false))
}
