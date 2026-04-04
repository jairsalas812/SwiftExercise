import Cocoa


//protocolo del dia anterior

protocol Describable{
     var description: String {get}
}

//Enum  de categorias

enum  Category : String, CaseIterable,Codable{// caseiteable hace que podamos leer datos del enum y codable  hace que se puedan convertir  en json y leersee json/.
    
    case electronics = "Electronica"
    case clothing    = "Ropa"
    case food        = "Casa"
    case books       = "Libros"
     
}

// modelpo principal -identifiable  y codable  desde el primer dia

struct Product:Describable,Identifiable,Codable,Equatable{
    let id: UUID //UUID means uniersally unique idetifier
    var name : String
    var price :Double
    var category: Category
    
    //Protocolo decribible
    var description: String{
        "\(name)* \(category.rawValue)* $\(String(format: "%.2f", price))"
    }
    
    //datos de prueba  como static property
    static let   sampleData:[Product]=[
        Product(id:UUID(),name: "Iphone 15", price: 999.00, category:  .electronics),
        Product(id:UUID(),name: "Clean code", price: 35.00, category: .books),
        Product(id:UUID(),name: "Playera nike", price: 100.00, category:  .clothing),
        Product(id:UUID(),name: "Cafe oaxaca", price:10.00, category:  .food),
        
    ]
    
}

//Vericar value semantics

var original = Product.sampleData[0]
var copia    = original
copia.price  = 1.00

print(original.price)
print(copia.price)
