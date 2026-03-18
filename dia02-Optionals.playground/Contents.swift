import Cocoa


//whiitout  optionals (JS-Style thinking)
let name :String = "Andres"// always  has a value


//with  optionals -might be nil
var  nickname :String?=nil
nickname = "Andy"

//This won'n compile -you  Must unwrap first
//print(nickname.count) <- Error
//This compiles - safely unwrapped

if let n = nickname {print (n.count)}

var edad: Int? = nil


if let edad=edad {
    print("Tu edad es \(edad)")
}else {
        print("No hay un dato de edad")
}

func registrarUsuario(nombre: String?, telefono: String?) {
    
    // nombre es obligatorio — si no hay, no podemos continuar
    guard let nombre = nombre else {
        print("Error: el nombre es obligatorio")
        return
    }
    
    // telefono es opcional — ambos casos son válidos
    if let tel = telefono {
        print("Registrando a \(nombre) con tel: \(tel)")
    } else {
        print("Registrando a \(nombre) sin teléfono")
    }
}

// Pruébalo con estos casos:
registrarUsuario(nombre: "Ana",  telefono: "81-1234-5678")
registrarUsuario(nombre: "Luis", telefono: nil)
registrarUsuario(nombre: nil,    telefono: "81-9999-0000")





func mostrarEmail (email: String?){
    guard let e = email else{
        print("No hay email")
        return
    }
    
    // Aqui ya email es un string normal
    print("Enviando a :\(e)")
    
    
}

mostrarEmail(email: nil)
mostrarEmail(email: "salasiverjair@gmail.com")



func login(usuario: String?,contraseña: String?){
    guard let us = usuario else{
        print("Ingrese  un usuario")
        return
    }
    
    
    guard let con = contraseña else{
        print("Ingrese una contraseña")
        return
    }
    
    print("Bienvenido usuario \(us)")
}



login(usuario: "cal", contraseña: "c3434")
login(usuario: nil, contraseña: "78388")
login(usuario: "josue", contraseña: nil)


//Aprendiendo como usar ? y ??
//Lo que hago en estas lineas es asignar un valor por default a valores
// que no tengan uno (null) usando ??  entonces,cuando  se cheque que apodo es nullo
// se le asignara el valor de "anonimo" si cmabias el valor de apodo a  un valor no nulo este se imprimira de forma correcta en la llamada de la funcion.
var apodo: String? = nil

let nombre = apodo ?? "Anonimo"

print(nombre)



//Ahora vamos a validar  con ?





struct Perfil {
    var bio: String?        // puede no tener bio
}

struct Usuario {
    var nombre: String
    var perfil: Perfil?     // puede no tener perfil configurado
}

// Simulando una búsqueda en base de datos
// A veces encuentra al usuario, a veces no
func buscarUsuario(id: Int) -> Usuario? {
    if id == 5 {
        return Usuario(nombre: "Pedro", perfil: Perfil(bio: "Dev iOS"))
    }
    return nil  // ese ID no existe
    
}

let usuario = buscarUsuario(id: 5)

// Aquí usuario SÍ es opcional porque puede no existir
print(usuario?.perfil?.bio ?? "Sin bio")
