//
//  DataInteractor.swift
//  SolarSistema
//
//  Created by Miguel Monllau on 14/8/24.
//

import Foundation

protocol DataInteractor:JSONInteractor {
    var url: URL { get }
    func getPlanets() throws -> [PlanetModel]
}
extension DataInteractor {
    var url: URL{Bundle.main.url(forResource: "SolarSystem", withExtension: "json")!}
    func getPlanets() throws -> [PlanetModel] {
        try loadJSON(url: url, type: [PlanetDTO].self).map(\.toPresentation)
    }
}
struct Interactor:DataInteractor, JSONInteractor {
    static let shared = Interactor()
}
