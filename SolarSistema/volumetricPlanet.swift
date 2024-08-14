//
//  volumetricPlanet.swift
//  SolarSistema
//
//  Created by Miguel Monllau on 18/8/24.
//

import SwiftUI

struct volumetricPlanet: View {
    @Environment(PlanetsViewModel.self) private var planetsVM
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview(windowStyle: .volumetric, traits: .fixedLayout(width: 1.0, height: 1.0, depth: 1.0)) {
    volumetricPlanet()
        .environment(PlanetsViewModel(interactor: DataTest()))
}
