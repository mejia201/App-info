//
//  Restaurante.swift
//  Multivista
//
//  Created by Bryan Mejia on 7/10/23.
//

import SwiftUI

struct Restaurante: View {
    
    @State private var seleccionBebida = 0
    @State private var seleccionComida = 0
    @State private var seleccionPostre = 0
    @State private var cantidadBebida = 1
    @State private var cantidadComida = 1
    @State private var cantidadPostre = 1
    
    let bebidas = ["Cafe", "Té"]
    let preciosBebidas = [2.5, 2.0]
    
    let comidas = ["Hamburguesa", "Pizza"]
    let preciosComidas = [5.0, 8.0]
    
    let postres = ["Helado", "Tres leches"]
    let preciosPostres = [1.0, 3.0]
    
    var totalPagar: Double {
        let precioBebida = preciosBebidas[seleccionBebida]
        let precioComida = preciosComidas[seleccionComida]
        let precioPostre = preciosPostres[seleccionPostre]
        let total = (precioBebida * Double(cantidadBebida)) + (precioComida * Double(cantidadComida) + (precioPostre * Double(cantidadPostre)))
        
        return total
    }
    
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Bebida")){
                    Picker("Selecciona una bebida", selection: $seleccionBebida){
                        ForEach(0..<bebidas.count, id: \.self){
                            Text(bebidas[$0])
                        }
                    }
                    Stepper("Cantidad: \(cantidadBebida)", value: $cantidadBebida, in: 1...10)
                    Text("Precio: $\(String(format: "%.2f", preciosBebidas[seleccionBebida] * Double(cantidadBebida)))")
                }
                
                
                Section(header: Text("Comida")){
                    Picker("Selecciona una comida", selection: $seleccionComida){
                        ForEach(0..<comidas.count, id: \.self){
                            Text(comidas[$0])
                        }
                    }
                    Stepper("Cantidad: \(cantidadComida)", value: $cantidadComida, in: 1...10)
                    Text("Precio: $\(String(format: "%.2f", preciosComidas[seleccionComida] * Double(cantidadComida)))")
                }
                
                
                Section(header: Text("Postres")){
                    Picker("Selecciona una comida", selection: $seleccionPostre){
                        ForEach(0..<postres.count, id: \.self){
                            Text(postres[$0])
                        }
                    }
                    Stepper("Cantidad: \(cantidadPostre)", value: $cantidadPostre, in: 1...10)
                    Text("Precio: $\(String(format: "%.2f", preciosPostres[seleccionPostre] * Double(cantidadPostre)))")
                }
                
                Section(header: Text("Total a pagar")){
                    Text("Total: $\(String(format: "%.2f", totalPagar))")
                }
                
                
            }
            
            .navigationBarTitle("Pedidos")
        }
    }
}

struct Restaurante_Previews: PreviewProvider{
    static var previews: some View{
        
        Restaurante()
    }
}

