//
//  PlanetModel.swift
//  SolarSistema
//
//  Created by Miguel Monllau on 14/8/24.
//

import Foundation

struct PlanetModel : Identifiable, Hashable {
    let id: UUID
    let name: String
    let diameterKm: Int
    let averageTemperatureCelsius: Int
    let waterPercentage: Double
    let numberOfSatellites: Int
    let satellites: [String]
    let distanceFromSunKm: Int
    let orbitalPeriodDays: Double
    let rotationPeriodHours: Double
    let atmosphereComposition: [AtmosphereComposition]
    let description: String
    let scale: Double
    let order: Int
    let positionZ: Double
    let model3d: String
}

extension PlanetDTO {
    var toPresentation: PlanetModel {
        PlanetModel(id: UUID(),
                    name: name,
                    diameterKm: diameterKm,
                    averageTemperatureCelsius: averageTemperatureCelsius,
                    waterPercentage: waterPercentage,
                    numberOfSatellites: numberOfSatellites,
                    satellites: satellites,
                    distanceFromSunKm: distanceFromSunKm,
                    orbitalPeriodDays: orbitalPeriodDays,
                    rotationPeriodHours: rotationPeriodHours,
                    atmosphereComposition: atmosphereComposition,
                    description: description,
                    scale: scale.first ?? 0.0,
                    order: order,
                    positionZ: positionZ,
                    model3d: model3d)
    }
}
