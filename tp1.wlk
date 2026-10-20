//---------------------------------------------------------------------------------------------------------------------
//                                          ENTREGA 1 - TP OBJETOS
//---------------------------------------------------------------------------------------------------------------------
// Barril (Integrante 1)
object barril {
  var property precioBebida = 300
  const property personasPorBarril = 40

  method barrilesPara(invitados) = 
    (invitados / personasPorBarril) . roundUp()
  method costoBebida(invitados) = 
    self.barrilesPara(invitados) * precioBebida
}
// Doña Rosa (Integrante 1)
object doniaRosa {
  const property bebida = barril
  var property precioInvitado = 20

  method costoServicio(invitados) = precioInvitado * invitados
  method precioPor(invitados) = self.costoServicio(invitados) + bebida.costoBebida(invitados)
}

// Pizzas Nico (Integrante 3)
object pizzasNico {
  const  property invitadosPorBloque = 10
  const  property precioPorBloque = 350
  var property costoBarril = barril

  method costoServicio(invitados) = 
    ((invitados / invitadosPorBloque).roundUp() * precioPorBloque)
  method precioPor(invitados) = 
    self.costoServicio(invitados) + costoBarril.costoBebida(invitados)
}

// El Bodegón (Integrante 2)
object elBodegon{

  const property cobroPorInvitados = 900
  var property invitadosIncluidos = 25
  var property precioPorInvitadoExtra = 35
  
  method precioPor(invitados)=
     cobroPorInvitados + precioPorInvitadoExtra * (invitados - invitadosIncluidos).max(0)
}
// Sectores (Integrante 2 )
object sectorFamilia{
  var property mesas = 6
  var property invitado = 4

  method cantidadInvitados() = mesas * invitado  

}

object sectorFacultad{
  const property grupos = 3
  var property  acompaniantes = 2
  var property integrantes = 4

  method cantidadInvitados() = grupos * (integrantes + acompaniantes)
}


// Isabella (Integrante 3)
object isabella {
  var property ahorro = 2750
  const porcentajeDisponible = 0.6
  var property sectorPrincipal = sectorFamilia
  var property sectorSecundario = sectorFacultad

  method ahorrar(monto) = ahorro + monto 

  method presupuestoMaximo() = ahorro * porcentajeDisponible

  method cantidadInvitados() = sectorPrincipal.cantidadInvitados() + sectorSecundario.cantidadInvitados()

  method contrataCatering(catering) =
    catering.precioPor(self.cantidadInvitados()) <= self.presupuestoMaximo() 
  
}
