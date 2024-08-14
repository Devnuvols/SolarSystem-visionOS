//
//  PlanetsViewModel.swift
//  SolarSistema
//
//  Created by Miguel Monllau on 15/8/24.
//

import SwiftUI

@Observable
final class PlanetsViewModel {
    let interactor: DataInteractor
    
    var planets: [PlanetModel]
    var selectedPlanet: PlanetModel?
    
    @ObservationIgnored var errorMsg = ""
    var showAlert = false
    
    init(interactor: DataInteractor = Interactor() ) {
        self.interactor = interactor
        do {
            self.planets = try interactor.getPlanets()
        } catch {
            self.planets=[]
            errorMsg = "Error en la carga del JSON \(error)."
            showAlert.toggle()
        }
    }
}
