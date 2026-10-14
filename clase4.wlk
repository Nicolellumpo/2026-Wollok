// -------------------------------------------------------------------------------------------------------------------
//                                             Modulo 13 y 14
// -------------------------------------------------------------------------------------------------------------------
class Ave { 
    var energia = 50 
    
    method volar(kilometros) { 
    energia = energia - (kilometros + 10) 
    } 
    method comer(gramos) { 
        energia = energia + gramos * 4 
    } 
} 

// const pepita = new GolondrinaTijerita() 

class GolondrinaTijerita inherits Ave { } 

class Petrel inherits Ave { 
    var kilometrosVolados = 0 
    override method volar(kilometros) { 
        super(kilometros) 
        kilometrosVolados = kilometrosVolados + kilometros 
    } 

    //override method volar(kilometros) { 
       // energia = energia - (kilometros + 10)
        //kilometrosVolados = kilometrosVolados + kilometros 
    //} 
} 

// const unPetrel = new Petrel() 
//  unPetrel.volar(10) 
//  unPetrel.volar(20) 

class Torcaza inherits Ave { 
    
    override method comer(gramos) {
         self.volar(1) 
         super(gramos) 
    } 
} 





// -------------------------------------------------------------------------------------------------------------------
//                                        Ejemplo en clase
// -------------------------------------------------------------------------------------------------------------------
class Cuenta {
  var property saldo

  method depositar(monto) {
    self.validarMontoPositivo(monto)
    saldo += monto
  }

  method transferir(monto) {
    self.validarMontoPositivo(monto)
    saldo -= monto
  }

  method validarMontoPositivo(monto) {
    if (monto <0) throw new DomainException(message = "El monto "+ monto.toString() + " debe ser positivo.")
  }

  method costoDeMantenimiento()
}

class CuentaCorriente inherits Cuenta{

  override method costoDeMantenimiento() = 1500

  override method transferir(monto) {
    super(monto)
    saldo -= monto *0.01
  }
}

class CuentaRemunerada inherits Cuenta { 

  var acumulado = 0

  override method depositar(monto){
    self.validarMontoPositivo(monto)
    acumulado += monto
  }

  method cuantoRinde() = acumulado * 1.15

  method rescatar(){
    saldo += self.cuantoRinde()
    acumulado = 0
  }

  override method costoDeMantenimiento() = if (acumulado.even()) 100 else 1400
}

object cuentaFede inherits Cuenta (saldo = 1000) {
  const limite = 500
  override method transferir(monto){
    if (monto > limite) throw new DomainException(message ="usted no puede superar el límite de $" + limite.toString())
    super(monto)
  }

  override method costoDeMantenimiento() = 0
}