//
//  HomeView.swift
//  RideShare
//
//  Created by DREAMWORLD on 20/12/24.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    
    @StateObject private var locationManager = LocationManager()
    @State private var selectedOption: Method = .transport
    @State private var isNavigating: Bool = false
    @State private var isNavigate: Bool = false
    @State private var isViewPresented: Bool = false
    @State private var isConfirmPresented: Bool = false
    @State private var selectedLocationData: String? = nil
    @State private var currentLocationData: String? = nil
    @State private var isModalDismissed: Bool = false
    @State private var isDismissed: Bool = false
    @Binding var isSideMenuOpen: Bool
    @State private var startCoordinate = CLLocationCoordinate2D(latitude: 21.237355, longitude: 72.877230) // Example start point
    @State private var endCoordinate = CLLocationCoordinate2D(latitude: 21.241717, longitude: 72.881090)  // Example end point
    @State private var pathCoordinates = [
        CLLocationCoordinate2D(latitude: 21.237355, longitude: 72.877230), // Start
        CLLocationCoordinate2D(latitude: 21.237998, longitude: 72.879147),
        CLLocationCoordinate2D(latitude: 21.238201, longitude: 72.879416),
        CLLocationCoordinate2D(latitude: 21.238923, longitude: 72.879905),
        CLLocationCoordinate2D(latitude: 21.241717, longitude: 72.881090)  // End
    ]
    
    @State var isDriverInfoOpen = false
    @State private var driverAction: DriverInfoAction? = nil
    @State private var isNavigateWithAction: Bool = false
    let detail: CarModel?

    var body: some View {
        NavigationStack {
            ZStack {
//                GoogleMapView(userLocation: $locationManager.latestLocation)
                GoogleMapWithPolylineView(
                    startCoordinate: $startCoordinate,
                    endCoordinate: $endCoordinate,
                    pathCoordinates: pathCoordinates
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        Button(action: {
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
                        
                        Button(action: {
                            isNavigating = true
                        }) {
                            Image("ic_notification")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .shadow(radius: 4)
                        }
                        .navigationDestination(isPresented: $isNavigating, destination: {
                            NotificationView()
                        })
                        .padding(.trailing, 16)
                    }
                    .padding(.top, 44)
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            print("Rental button tapped")
                        }) {
                            Text("Rental")
                                .font(Font.custom(poppinsMedium, size: 16))
                                .foregroundColor(.white)
                                .padding(.vertical, 15)
                                .padding(.horizontal, 40)
                                .background(themePrimaryGreenColor)
                                .cornerRadius(8)
                                .shadow(radius: 4)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            print("Current location button tapped")
                        }) {
                            Image("ic_current_location")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .shadow(radius: 4)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 12)
                    
                    VStack {
                        HStack {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.black)
                                Text("Where would you go?")
                                    .foregroundColor(.gray)
                                    .font(Font.custom(poppinsMedium, size: 16))
                                Spacer()
                                Image(systemName: "heart")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(themePrimaryLightGreenColor)
                            .cornerRadius(8)
                        }
                        .padding(.top, 12)
                        .padding(.bottom, 12)
                        .padding(.horizontal, 16)
                        
                        HStack(spacing: 0) {
                            Button(action: {
                                selectedOption = .transport
                                isNavigate = true
                            }) {
                                Text("Transport")
                                    .font(Font.custom(poppinsMedium, size: 16))
                                    .foregroundColor(selectedOption == .transport ? .white : .black)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(selectedOption == .transport ? themePrimaryGreenColor : Color.clear)
                                    .cornerRadius(8)
                            }
                            .fullScreenCover(isPresented: $isNavigate, onDismiss: {
                                if !isModalDismissed {
                                    isViewPresented = true
                                }
                            }) {
                                SelectLocationView(selectedLocationData: $selectedLocationData, currentLocationData: $currentLocationData, isModalDismissed: $isModalDismissed)
                            }
                            .fullScreenCover(isPresented: $isViewPresented, onDismiss: {
                                if !isDismissed {
                                    isConfirmPresented = true
                                }
                            }) {
                                ConfirmSelectedLocationView(selectedLocationData: $selectedLocationData, currentLocationData: $currentLocationData, isDismissed: $isDismissed)
                            }
                            .navigationDestination(isPresented: $isConfirmPresented, destination: {
                                SelectTransportView(selectedLocationData: $selectedLocationData, currentLocationData: $currentLocationData)
                            })
                            
                            Button(action: {
                                selectedOption = .delivery
                            }) {
                                Text("Delivery")
                                    .font(Font.custom(poppinsMedium, size: 16))
                                    .foregroundColor(selectedOption == .delivery ? .white : .black)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(selectedOption == .delivery ? themePrimaryGreenColor : Color.clear)
                                    .cornerRadius(8)
                            }
                        }
                        .background(themePrimaryLightGreenColor)
                        .cornerRadius(8)
                        .padding(.bottom, 12)
                        .padding(.horizontal, 16)
                    }
                    .background(themeLightGreenColor)
                    .cornerRadius(8)
                    .padding(.horizontal, 16)
                }
                .padding(.bottom, UIScreen.main.bounds.height / 9 + 65)
            }
        }
        .fullScreenCover(isPresented: $isDriverInfoOpen, onDismiss: {
            if let action = driverAction {
                handleDriverAction(action)
            }
        }, content: {
            DriverInfoView(selectedAction: $driverAction, detail: detail!)
        })
        .navigationDestination(isPresented: $isNavigateWithAction) {
            if let action = driverAction {
                switch action {
                case .call:
                    CallingView()
                case .message:
                    MessageView()
                case .paymentMethod:
                    NotificationView()
                }
            }
        }
    }
    private func handleDriverAction(_ action: DriverInfoAction) {
        switch action {
        case .call:
            print("Call action triggered")
            isNavigateWithAction = true
        case .message:
            print("Message action triggered")
            isNavigateWithAction = true
        case .paymentMethod:
            print("Payment method selected")
            isNavigateWithAction = true
        }
    }
}

#Preview {
    HomeView(isSideMenuOpen: .constant(false), detail: CarModel(name: "BMW Cabrio", carImage: "ic_bmw_cabrio", type: "Automatic", seat: "3 seats", fuleType: "Octane", distation: "800m (5mins away)"))
}
