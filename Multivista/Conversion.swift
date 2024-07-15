//
//  Conversion.swift
//  Multivista
//
//  Created by Bryan Mejia on 7/10/23.
//

import SwiftUI

struct Conversion: View {
    
    @State private var valorEntrada = ""
    @State private var unidadEntrada = 0
    @State private var unidadSalida = 0
    @State private var resultado = ""
    
    @State private var tipoDeConversionSeleccionado = 0
    let tiposDeConversion = ["Peso", "Distancia", "Moneda"]
    
    let unidadesPeso: [(String, String)] = [
        
        ("Kilogramos", "scalemass"),
        ("Libras", "scalemass"),
        ("Gramos", "scalemass")
    
    ]
    
    let unidadesDistancia: [(String, String)] = [
        
        ("Kilómetros", "map.fill"),
        ("Millas", "map"),
        ("Metros", "map")
    
    ]
    
    let unidadesMoneda: [(String, String)] = [
        ("Dólares", "dollarsign.circle.fill"),
        ("Euros", "eurosign.circle.fill"),
        ("Pesos Mexicanos", "dollarsign.circle.fill")
    ]
    
    var unidades: [(String, String)]{
        switch tipoDeConversionSeleccionado{
        case 0: return unidadesPeso
        case 1: return unidadesDistancia
        case 2: return unidadesMoneda
        default: return []
            
        }
    }
    
    
    var valorConvertido: Double {
        let valorEntrada = Double(valorEntrada) ?? 0
        let unidadEntrada = unidades[unidadEntrada]
        let unidadSalida = unidades[unidadSalida]
        
        switch(unidadEntrada.0, unidadSalida.0){
            
        case ("Kilogramos", "Libras"):
            return valorEntrada * 2.20462
            
        case("Libras", "Kilogramos"):
            return valorEntrada / 2.20462
            
            
        case("Gramos", "Kilogramos"):
            return valorEntrada / 1000
            
        case("Kilogramos", "Gramos"):
            return valorEntrada * 1000
            
        case("Libras", "Gramos"):
            return valorEntrada * 453.6
            
        case("Gramos", "Libras"):
            return valorEntrada / 453.6
            
            
        case("Kilómetros", "Millas"):
            return valorEntrada / 1.60934
            
        case("Millas", "Kilómetros"):
            return valorEntrada * 1.60934
            
            
        case("Metros", "Kilómetros"):
            return valorEntrada / 1000
            
        case("Kilómetros", "Metros"):
            return valorEntrada * 1000
            
        case("Millas", "Metros"):
            return valorEntrada * 1609
            
        case("Metros", "Millas"):
            return valorEntrada / 1609

            
            
            
        case("Dólares", "Euros"):
            return valorEntrada * 0.85
            
        case("Euros", "Dólares"):
            return valorEntrada / 0.85
            
        case("Pesos Mexicanos", "Dólares"):
            return valorEntrada * 0.055
            
            
        case("Dólares", "Pesos Mexicanos"):
            return valorEntrada * 18.16
            
            
        case("Pesos Mexicanos", "Euros"):
            return valorEntrada * 0.052
            
            
        case("Euros", "Pesos Mexicanos"):
            return valorEntrada * 19.24
              
        default:
            return valorEntrada
            
        }
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                Picker("Tipo de Conversión", selection: $tipoDeConversionSeleccionado){
                    ForEach(0..<tiposDeConversion.count, id: \.self){ indice in
                        Text(self.tiposDeConversion[indice])
                            .font(.headline)
                        
                    }
                }
                
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                
                Form {
                    Section(header: Text("Conversión")){
                        TextField("Valor", text: $valorEntrada)
                            .keyboardType(.decimalPad)
                        
                        Picker("Unidad de entrada", selection: $unidadEntrada){
                            ForEach(0..<unidades.count, id: \.self){indice in
                                HStack{
                                    Image(systemName: unidades[indice].1)
                                    Text(unidades[indice].0)
                                }
                                
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    
                    Section(header: Text("Convertir a")){
                        
                        Picker("Unidad de salida", selection: $unidadSalida){
                            ForEach(0..<unidades.count, id: \.self){indice in
                                HStack{
                                    Image(systemName: unidades[indice].1)
                                    Text(unidades[indice].0)
                                }
                                
                            }
                        }
                        
                        .pickerStyle(MenuPickerStyle())
                        
                        
                    }
                    
                    Section(header: Text("Resultado")){
                        Text("\(valorConvertido, specifier: "%.2f")")
                        
                    }
                }
            }
            .navigationBarTitle("Conversor")
        }
    }
}

struct Conversion_Previews: PreviewProvider{
    static var previews: some View{
        Conversion()
    }
}

