import Cocoa


// -1.Protocolo con implementacion por defecto

protocol Describible{
    func descripcion() -> String
}

extension Describible {
    func descripcion() -> String {
        return "No hay descripcion disponible"
    }
}

//-- 2. TRes struct comformando el protocolo

struct Product: Describible{
    let nombre: String
    let precio: Double
    
    func descripcion() -> String {
        return " Producto:\(nombre), $\(precio)"
    }
    
}

struct User: Describible{
    let nombre: String
    let edad: Int
    
    func descripcion() -> String {
        return "Usuario:\(nombre), Edad:\(edad)"
    }
}

struct Order: Describible{
    
    let id:String
    let total:Double
    //No implementa descripciion() -> usa el default  de la expresion
    
}

// - 3. ENUM Network State  con Associated  Values

enum NetworkState{
    
    case  idle
    case loading
    case succces(String)
    case failure (Error)
    
    var isLoading: Bool {
        if case .loading = self {return true}
        return false
    }
    
    var message : String  {
        switch self {
        case .idle:
            return "En espera"
        case .loading:
            return "Cargando..."
        case .succces(let data):
            return "Exito:\(data)"
        case .failure(let error):
            return "Error:\(error.localizedDescription)"
        }
    }
}

//- Prueba en playground -----------------------

let producto = Product (nombre:"iphone 15",precio: 999.99)
let usuario = User (nombre:"Paco",edad: 30)
let orden  = Order(id: "ORD-001", total: 1250.0)

print(producto.descripcion())
print(usuario.descripcion())
print(orden.descripcion())

let estado: NetworkState = .succces("Datos recibidos")
print(estado.isLoading)//false
print(estado.message)//Exito: Datos reciidos

let cargando: NetworkState = .loading
print(cargando.isLoading)//True
