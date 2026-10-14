// ----------------------------------------------------------------------------------------------------
//                                             Clase 07 - 10
// ----------------------------------------------------------------------------------------------------
/* 
object elPrincipito { 
  var property precio = 100 
  
  method esCaro() = precio > 150 
  method aumentar(aumento) { 
    precio = precio + aumento 
  } 
} 
object martinFierro { 
  var property precio = 100 
  
  method esCaro() = precio > 150 
  method aumentar(aumento) { 
    precio = precio + aumento 
  } 
} 

object elReinoDelReves { 
  var property precio = 100 

  method esCaro() = precio > 150 
  method aumentar(aumento) { 
    precio = precio + aumento 
  } 
} 
*/
class Libro {
   var property precio = 100 
   
   method esCaro() = precio > 150 
   method aumentar(aumento) { 
    precio = precio + aumento 
   } 
} 
// const martinFierro = new Libro()  
// const elPrincipito = new Libro() 
// const elReinoDelReves = new Libro() 

// ----------------------------------------------------------------------------------------------------
class DVD { 
  var property precioMinuto = 10 
  var property cantidadMinutos = 90 
  
  method precio() = precioMinuto * cantidadMinutos 
  method esCaro() = cantidadMinutos > 100 
} 
class Lamina { 
  var property ancho = 29.7 
  var property alto = 42 
  var property material = new Material() 
  
  method precio() = alto * ancho * self.precioBase() 
  method esCaro() = self.precioBase() > 50 
  method precioBase() = material.precio() 
}

class Material { 
  var property precio = 5 
} 
// const jurassicPark = new DVD() 
// const laGioconda = new Lamina() 


// ----------------------------------------------------------------------------------------------------
class Presentacion { 
  var property lugar 
  const property musicos = []
  var property valorEntrada 
  var property entradasVendidas  = 0
} 

//const seruEnLuna = new Presentacion( lugar = "lunaPark",  musicos = [seruGiran], valorEntrada = 2000,  entradasVendidas = 180) 

//const seruEnLuna = new Presentacion( entradasVendidas = 180, lugar = "lunaPark", musicos = ["seruGiran"],  valorEntrada = 2000) 

// const vamosAVerQuienEnLuna = new Presentacion( lugar = "lunaPark",  valorEntrada = 2000) 