//
//  LocationPermissionView.swift
//  RideShare
//
//  Created by DREAMWORLD on 16/12/24.
//

import SwiftUI
import MapKit

struct LocationPermissionView: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.094257, longitude: -118.331590),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )
    @StateObject private var locationManager = LocationManager()
    @State private var isNavigating: Bool = false
    @State private var isNavigateWelcome: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                Map(position: $position)
                    .mapStyle(.standard)
            }
            .background(.white)
            .navigationBarHidden(true)
            .ignoresSafeArea(edges: .bottom)
            .overlay {
                VStack {
                    Spacer()
                    VStack {
                        Image("img_location")
                            .padding(.top, 30)
                            .padding(.bottom, 24)
                        Text("Enable your location")
                            .font(Font.custom(poppinsMedium, size: 24))
                            .foregroundColor(.black)
                            .padding(.bottom, 4)
                        Text("Choose your location to start find the request around you")
                            .font(Font.custom(poppinsMedium, size: 14))
                            .foregroundColor(subTitleColor)
                            .padding(.horizontal, 40)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 30)
                        
                        Button {
                            locationManager.checkLocationAuthorization { status in
                                isNavigating = true
                                UserDefaults.standard.setValue(true, forKey: "Permission_Asked")
                            }
                        } label: {
                            Text("Use my location")
                                .frame(maxWidth: .infinity)
                                .font(Font.custom(poppinsMedium, size: 16))
                                .padding()
                                .background(themePrimaryGreenColor)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .padding(.horizontal, 16)
                        }
                        .navigationDestination(isPresented: $isNavigating, destination: {
//                            WelcomeView()
                            TabbarView()
                        })
                        
                        Button("Skip for now") {
                            isNavigateWelcome = true
                        }
                        .navigationDestination(isPresented: $isNavigateWelcome, destination: {
                            WelcomeView()
                        })
                        .font(Font.custom(poppinsMedium, size: 16))
                        .foregroundColor(textFieldGrayBoarder)
                        .padding(.top, 24)
                        .padding(.bottom, 30)
                    }
                    .background(.white)
                    .cornerRadius(12)
                    .frame(width: UIScreen.main.bounds.width - 32, height: UIScreen.main.bounds.height)
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(.black.opacity(0.5))
                .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}

#Preview {
    LocationPermissionView()
}
