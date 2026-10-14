object pepita{
  var property energia   = 100

  method vuela(minutos) {
    energia = energia - minutos * 3
  }

  method come(gramos) {
    energia = energia + gramos
  }

  method duerme(horas) {
    energia = energia + horas * 10
  }

  method comeYDuerme(gramos, horas) {
    self.come(gramos)
    self.duerme(horas*2)
  }

  method estaFeliz() {
        return energia > 50
    }
}

object azul{
  var property energia   = 100

  method vuela(minutos) {
    energia = energia - minutos * 5
  }

  method estaFeliz() {
        return energia > 80
    }
}

object rosa{

  method estaFeliz() {
        return true
    }

  method vuela(energia) {
   return energia * 5
  }
}

// pepita y azul son POLIMORFICOS, para el mensaje estaFeliz() PERO para vuela() 
// NO ya que no reciben un mismo parametro.(energia != minutos)

//------------------------------------------Ejemplo de Property----------------------------------------------
object paloma {
    var energia = 100
    const rendimiento = 5

    method energia() {
        return energia
    }
    method energia(nuevaEnergia){
        energia = nuevaEnergia
    }
    method rendimiento() {
        return rendimiento
    }
}

object nicole {
    var property energia = 100
    const property rendimiento = 5
}

// Usando PROPERTY se reduce el codigo y es mas simple