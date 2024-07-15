import SwiftUI

struct ContentView: View {
    
    @State private var nombre = ""
    @State private var fechaNacimiento = Date()
    @State private var seleccionPais = "Seleccione un país"
    @State private var seleccionGenero = "Seleccione un genero"
    @State private var seleccionColor = "Seleccione un color "
    @State private var mensaje = ""
    
    let paises = ["Seleccione un país", "Guatemala", "Honduras", "El Salvador", "Nicaragua", "Costa Rica", "Panamá"]
    let generos = ["Seleccione un género", "Masculino", "Femenino", "Otros"]
    
    let colores = ["Selecciona un color", "Rojo", "Azul", "Morado", "Negro", "Blanco"]
    
    var body: some View {
        
        NavigationView{
            Form{
                Section(header: Text("Informacion Personal").font(.headline)){
                    TextField("Nombre", text: $nombre)
                    DatePicker("Fecha de nacimiento", selection: $fechaNacimiento, in: ...Date(),
                               displayedComponents: .date)
                    Picker("País", selection: $seleccionPais){
                        ForEach(paises, id: \.self){ pais in
                            
                            Text(pais)
                            
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    Picker("Género", selection: $seleccionGenero){
                        ForEach(generos, id: \.self){ genero in
                            
                            Text(genero)
                            
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    
                    Picker("Color", selection: $seleccionColor){
                        ForEach(colores, id: \.self){ color in
                            
                            Text(color)
                            
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section{
                    Button(action: {
                        generarMensaje()
                    }){
                        HStack {
                            Image(systemName: "checkmark.message.fill")
                            Text("Generar Mensaje")
                                .font(.headline)
                        }
                        
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding()
                }
                
                Section(header: Text("Mensaje Generado").font(.headline)){
                    Text(mensaje)
                        .multilineTextAlignment(.center)
                    
                }
            }
            
            .navigationBarTitle("App informativa")
            
        }
    }
    
    func generarMensaje(){
        
        let edad = Calendar.current.dateComponents([.year], from: fechaNacimiento, to: Date()).year ?? 0
        mensaje = "Hola, \(nombre). Tienes \(edad) años y eres de \(seleccionPais). Tú género es \(seleccionGenero). Y tu color favorito es el \(seleccionColor)"
        
    }
    
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

