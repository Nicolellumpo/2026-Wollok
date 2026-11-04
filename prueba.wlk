object pepita2 { 
    var energia = 100 
    
    method energia() { return energia } 
    
    method esFuerte() { return energia > 50 } 
    
    method volar(kms) { energia = energia - (kms + 10) } 
    
    method comer(gramos) { energia = energia + 4 * gramos } 
} 

class Proveedores{
 
  method precioBase() =  2
  
}
 class Salon inherits Proveedores {
  override method precioBase()= super()* 4
 }

// eAl usar self.PrecioBase() va entrar en loop, ya que va llamar recursivamente su propio metodo
  class Salon2 inherits Proveedores {
  override method precioBase()= self.precioBase()* 4
 }

