//  ----------------------------------------------------------------------------------------------------
//                                             Clase 23-9
// ----------------------------------------------------------------------------------------------------
object shrek {
    const misiones = #{}

    method agregarMisiones(unaMision) {
         misiones.add(unaMision)
    }
    method misionesDificiles() = misiones.filter({mision => mision.esDificil()})

    method nombresDeEncargados()= misiones.map({mision => mision.encargado()})
    
    method complicarTodo(){
        misiones.forEach({misiones => misiones.complicada()})
    }
}

object rescatarAFiona{
  var property trolls = 3 
  const property encargado = "Lord"

  method esDificil() =  trolls.between(4, 6)
  method complicada() {trolls = 5}
  
}

object buscarPiedraFilosofal {
  var property distancia = 120
  const property encargado =  "Mr dumblecofcofdore"
  
  method esDificil() =  distancia > 100
  method complicada() {distancia = 150}
}
