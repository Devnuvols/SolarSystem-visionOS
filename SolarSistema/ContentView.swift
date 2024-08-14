//
//  ContentView.swift
//  SolarSistema
//
//  Created by Miguel Monllau on 14/8/24.
//

import SwiftUI
import RealityKit
import compo_m1


struct ContentView: View {
    
    @Environment(PlanetsViewModel.self) private var planetsVM
    
    @Environment (\.openWindow) private var open
    
    
    @State private var rotationAngle: Double = 0.0
    
    @State private var touch = false
    @State private var rotate = true
    
    @State private var currentRotation: CGFloat = 0.0
    @State private var lastDragValue: CGFloat = 0.0
    @State private var velocity: CGFloat = 0.0
    
    @State private var inertialTimer: Timer?
    
    var body: some View {
        @Bindable var planetBindable = planetsVM
        
        NavigationSplitView {
            List(selection: $planetBindable.selectedPlanet) {
                ForEach(planetsVM.planets) {planet in Text(planet.name)
                        .tag(planet)
                }
            }
            .navigationTitle("Planetas")
            .navigationSplitViewColumnWidth(200)
            .toolbar{
                ToolbarItem(placement: .bottomOrnament){
                    HStack (spacing: 30){
                        Toggle(isOn: $rotate){
                            Image(systemName: "rotate.3d")
                        }
                        .toggleStyle(.button)
                        
                        if let selectedPlanet = planetsVM.selectedPlanet {
                            Text(selectedPlanet.name)
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                .padding(10)
                                .glassBackgroundEffect()
                        }
                        Toggle(isOn: $touch){
                            Image(systemName: "hand.tap")
                        }
                        .toggleStyle(.button)
                        .disabled(rotate)
                        Button {
                            open(id: "planetDetail")
                        } label: {
                            Text("Ver en detalle")
                        }
                        
                    }
                    
                }
                }
            
            } content: {
                if let selectedPlanet = planetsVM.selectedPlanet {
                    planetDetail(selectedPlanet: selectedPlanet)
                }
            } detail: {
                if let selectedPlanet = planetsVM.selectedPlanet {
                    Model3D(named: selectedPlanet.model3d, bundle: compo_m1Bundle) {
                        model in
                        model
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.7)
                            .offset(y: -100)
                            .rotation3DEffect(.degrees(rotationAngle), axis: (x:0, y: -1, z:0))
                            .rotation3DEffect(.degrees(Double(currentRotation)), axis: (x:0, y: -1, z:0))
                    } placeholder:  {
                        ProgressView()
                    }
                    .gesture(
                            DragGesture()
                                .onChanged { value in
                                    let delta = value.translation.width - lastDragValue
                                    velocity = delta/10
                                    lastDragValue = value.translation.width
                                    if touch {
                                        currentRotation -= velocity
                                    }
                                }
                                .onEnded{_ in
                                    lastDragValue = 0.0
                                    startInertia()
                                }
                    )
                }
                    
            }
            .onAppear(){
                doRotation()
                planetsVM.selectedPlanet = planetsVM.planets.first
            }
           
            .alert("App error",isPresented: $planetBindable.showAlert) {} message:
            {
                Text(planetsVM.errorMsg)
            }
    }
    
    func doRotation() {
        Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true){
            timer in
            if rotate{
                rotationAngle += 0.1
                if rotationAngle >= 360 { rotationAngle = 0}
            }
                
        }
    }
    
    func startInertia() {
        inertialTimer?.invalidate()
        inertialTimer = Timer.scheduledTimer(withTimeInterval: 0.016, repeats: true) { timer in
            if abs(velocity) < 0.01 {
                timer.invalidate()
                inertialTimer = nil
            } else {
                velocity *= 0.95
                currentRotation -= velocity
            }
        }
    }
}
        
        
        


#Preview(windowStyle: .automatic) {
    ContentView.preview
}
