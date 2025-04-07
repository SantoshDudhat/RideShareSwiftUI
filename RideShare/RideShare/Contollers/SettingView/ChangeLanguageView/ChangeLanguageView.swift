//
//  ChangeLanguageView.swift
//  RideShare
//
//  Created by DREAMWORLD on 26/12/24.
//

import SwiftUI
enum LanguageOptions: CaseIterable {
    case english
    case hindi
    case arabic
    case french
    case german
    case portuguese
    case turkish
    case dutch
    
    var id: String { title }

    var title: String {
        switch self {
        case .english:
            return "English"
        case .hindi:
            return "Hindi"
        case .arabic:
            return "Arabic"
        case .french:
            return "French"
        case .german:
            return "German"
        case .portuguese:
            return "Portuguese"
        case .turkish:
            return "Turkish"
        case .dutch:
            return "Dutch"
        }
    }
    
    var subTitle: String {
        switch self {
        case .english:
            return "English"
        case .hindi:
            return "Hindi"
        case .arabic:
            return "Arabic"
        case .french:
            return "French"
        case .german:
            return "German"
        case .portuguese:
            return "Portuguese"
        case .turkish:
            return "Turkish"
        case .dutch:
            return "Nederlands"
        }
    }
    
    var flag: String {
        switch self {
        case .english:
            return "flag_us"
        case .hindi:
            return "flag_india"
        case .arabic:
            return "flag_arab"
        case .french:
            return "flag_france"
        case .german:
            return "flag_german"
        case .portuguese:
            return "flag_portuguese"
        case .turkish:
            return "flag_turki"
        case .dutch:
            return "flag_dutch"
        }
    }
}

struct ChangeLanguageView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedLanguage: LanguageOptions = .english
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
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
                Text("Change Language")
                    .foregroundColor(.black)
                    .font(.custom(poppinsMedium, size: 18))
            }
            .padding(.horizontal, 16)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(LanguageOptions.allCases, id: \.id) { language in
                        LanguageRow(language: language, isSelected: language == selectedLanguage)
                            .onTapGesture {
                                selectedLanguage = language
                            }
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
            Spacer()
        }
        .background(.white)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    ChangeLanguageView()
}

struct LanguageRow: View {
    let language: LanguageOptions
    let isSelected: Bool

    var body: some View {
        HStack {
            Image(language.flag)
                .resizable()
                .frame(width: 46, height: 32)
                .cornerRadius(4)

            VStack(alignment: .leading) {
                Text(language.title)
                    .font(Font.custom(poppinsMedium, size: 16))
                Text(language.subTitle)
                    .font(Font.custom(poppinsRegular, size: 14))
                    .foregroundColor(textFieldGrayBoarder)
            }
            Spacer()

            if isSelected {
                Image("ic_checked")
            } else {
                Image("ic_uncheck")
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8).stroke(isSelected ? themeGreenColor : Color.hex("D0D0D0"), lineWidth: 1))
        .padding(.vertical, 4)
    }
}
