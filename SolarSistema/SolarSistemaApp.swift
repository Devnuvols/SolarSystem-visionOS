//
//  SolarSistemaApp.swift
//  SolarSistema
//
//  Created by Miguel Monllau on 14/8/24.
//

import SwiftUI

@main
struct SolarSistemaApp: App {
    @State var planetsVM = PlanetsViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(planetsVM)
        }
        WindowGroup(id: "planetDetail"){
            volumetricPlanet()
                .environment(planetsVM)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1.0, height: 1.0, depth: 1.0, in: .meters)
    }
}
