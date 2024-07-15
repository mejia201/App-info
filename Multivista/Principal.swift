//
//  Principal.swift
//  Multivista
//
//  Created by Bryan Mejia on 7/10/23.
//

import SwiftUI

struct Principal: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Vista Principal")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: ContentView()){
                    
                    Text("Ir a Información")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding()
                    
                }
                
                NavigationLink(destination: Conversion()){
                    
                    Text("Ir a Conversión")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                    
                }
                
                
                
                NavigationLink(destination: Restaurante()){
                    
                    Text("Ir a Restaurante")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding()
                    
                }
            }
            
            .navigationBarTitle("Vistas")
        }
    }
}


struct Principal_Previews: PreviewProvider{
    static var previews: some View{
        Principal()
    }
}

