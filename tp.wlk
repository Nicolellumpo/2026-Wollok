// ── Punto 1: bebida, Doña Rosa y Pizzas Nico ──

object barril {
  var property precioBebida = 300
  const property personasPorBarril = 40

  method barrilesPara(invitados) = (invitados / personasPorBarril) . roundUp()
  method costoBebida(invitados) = self.barrilesPara(invitados) * precioBebida
}

object donaRosa {
  var property invitado = 20

  method precioPor(invitados) = invitado * barril.costoBebida(invitados)

}

// Pizzas Nico (Integrante 3)

// ── Punto 2: El Bodegón y los sectores ── (Integrante 2)

// El Bodegón

// Sector

// ── Punto 3: Isabella ── (Integrante 3)

// Isabella