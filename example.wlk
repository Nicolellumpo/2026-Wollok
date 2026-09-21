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

// pepita y azul son POLIMORFICOS, para los mensajes vuela(minutes) y estaFeliz().