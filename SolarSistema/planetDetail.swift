//
//  planetDetail.swift
//  SolarSistema
//
//  Created by Miguel Monllau on 15/8/24.
//

import SwiftUI

struct planetDetail: View {
    let selectedPlanet: PlanetModel
    
    var body: some View {
        
            Form {
                Section {
                    Text(selectedPlanet.description)
                } header: {
                    Text("Descipcion")
                }
                Section {
                    LabeledContent("Diametro en km", value: "\(selectedPlanet.diameterKm)")
                    LabeledContent("Porcentaje agua", value: "\(selectedPlanet.waterPercentage)")
                    LabeledContent("Temperatura media", value: "\(selectedPlanet.averageTemperatureCelsius)")
                    LabeledContent("Numero de satelites", value: "\(selectedPlanet.numberOfSatellites)")
                    if selectedPlanet.numberOfSatellites > 0 {
                        LabeledContent("satelites:", value: "\(selectedPlanet.satellites.joined(separator: ", "))")
                    }
                } header: {
                    Text("Datos planetarios")
                }
                Section {
                    ForEach(selectedPlanet.atmosphereComposition)
                    { comp in Text(comp.elementDesc)
                    }
                } header: {
                    Text("Composicion")
                }
            }
            .navigationTitle(selectedPlanet.name)
        }
    }


#Preview {
    NavigationStack {
        planetDetail(selectedPlanet: .test)
            
    }
    .frame(width: 400)
}
