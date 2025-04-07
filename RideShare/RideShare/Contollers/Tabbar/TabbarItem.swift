//
//  TabBarItemView.swift
//  CenterTabBar
//
//  Created by Satyadev Chauhan on 07/03/23.
//

import SwiftUI

struct TabbarItem: View {
    
    @Binding var selected: Tab
    let tab: Tab
    
    let width, height: CGFloat
    
    var body: some View {
        VStack {
            Image(selected == tab ? tab.isSelectedImage : tab.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tab.rawValue)
                .font(Font.custom(poppinsRegular, size: 14))
            Spacer()
        }
        .padding(.horizontal, -4)
        .onTapGesture {
            selected = tab
        }
        .foregroundColor(selected == tab ? themeGreenColor : .black)
    }
}

struct TabBarIcon_Previews: PreviewProvider {
    static var previews: some View {
        TabbarItem(selected: .constant(.home), tab: .home, width: 80, height: 80)
    }
}
