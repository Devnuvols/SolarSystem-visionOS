//
//  JSONinteractor.swift
//  SolarSistema
//
//  Created by Miguel Monllau on 14/8/24.
//

import Foundation

protocol JSONInteractor {
    func loadJSON<JSON>(url: URL, type: JSON.Type) throws -> JSON where JSON: Codable
}
extension JSONInteractor {
    func loadJSON<JSON>(url: URL, type: JSON.Type) throws -> JSON where JSON: Codable {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(type, from: data)
        
    }
}
