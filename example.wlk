object pepita {
  var property energy   = 100

  method vuela(minutes) {
    energy = energy - minutes * 3
  }

  method come(gramos) {
    energy = energy + gramos
  }

  method duerme(horas) {
    energy = energy + horas * 10
  }

  method comeYDuerme(gramos, horas) {
    energy = energy + gramos + horas * 10
  }
}