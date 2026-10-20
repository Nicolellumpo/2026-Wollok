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
// Catering 
class Catering {
  var property bebida = barril

  method costoServicio(invitados) 
  method costoBebida(invitados) = bebida.costoBebida(invitados)

  method precioPor(fiesta) =
    self.costoServicio(fiesta.cantidadInvitados()) + self.costoBebida(fiesta.cantidadInvitados())
}
// Donia Rosa
object doniaRosa inherits Catering {
  var property precioInvitado = 20
  
  override method costoServicio(invitados) = precioInvitado * invitados
}
// Pizzas Nico
object pizzasNico inherits Catering {
  const property invitadosPorBloque = 10
  const property precioPorBloque = 350

  override method costoServicio(invitados) =
    (invitados / invitadosPorBloque).roundUp() * precioPorBloque
}

// El Bodegón
object elBodegon inherits Catering {
  const property cobroPorInvitados = 900
  var property invitadosIncluidos = 25
  var property precioPorInvitadoExtra = 35

  override method costoServicio(invitados) =
    cobroPorInvitados + precioPorInvitadoExtra * (invitados - invitadosIncluidos).max(0)
    
  override method precioPor(fiesta) = self.costoServicio(fiesta.cantidadInvitados())
}

//---------------------------------------------------------------------------------------------------------------------
//                                          ENTREGA 2 - TP OBJETOS
//---------------------------------------------------------------------------------------------------------------------

// Fiestas -  Punto 1 (Integrante 1)
class Fiesta {
  const sectores = []
  var property duracion

  method cantidadInvitados()  = sectores.sum({sector => sector.cantidadInvitados()})
  method cantidadDeSectores() = sectores.size()
  method esComplicada() = self.cantidadDeSectores() > 3
  method esLarga() = duracion > 5
}
class SectorPorMesa {
  var property mesas
  var property invitadosPorMesa

  method cantidadInvitados() = mesas * invitadosPorMesa
}
class SectorPorGrupos {
  const property grupos
  const property integrantesPorGrupo
  const property acompaniantesPorGrupo

  method cantidadInvitados() = grupos * (integrantesPorGrupo + acompaniantesPorGrupo)
}
// Proveedores - Punto 2 (Integrante 2)
/*class Proveedores{

  method precioPor(fiesta) = self.precioBase(fiesta) + self.precioExtra(fiesta)
  method precioBase(fiesta)
  method precioExtra(fiesta) = 0
}
 class Salon inherits Proveedores {
  const property montoFijoPorSector

  override method precioBase(fiesta)= (montoFijoPorSector * fiesta.cantidadDeSectores()) * fiesta.duracion()
}

class Organizadores inherits Proveedores{
  var property montoFijoPorSector 
  var property recargo  = 0.2

  override method precioBase(fiesta) = montoFijoPorSector * fiesta.cantidadDeSectores()
  override method precioExtra(fiesta) =  
    if (fiesta.esComplicada()) self.precioBase(fiesta) * recargo else 0
}

class EquiposMozos inherits Proveedores{
  var property cantidadMozosPorSector 
  var property horaPorMozo = 50

  override method precioBase(fiesta) = 
    cantidadMozosPorSector * horaPorMozo * fiesta.duracion() * fiesta.cantidadDeSectores()

}
class Seguridad inherits Proveedores{ 
  const  montoFijoPorSector = 100
  var property recargo 
  
  method aplicarRecargo(fiesta) = self.precioBase(fiesta) * recargo / 100
  override method precioBase(fiesta) = montoFijoPorSector * fiesta.cantidadDeSectores() 
  override method precioExtra(fiesta) =  
    if (fiesta.esLarga()) self.aplicarRecargo(fiesta)  else 0
    
}*/

class Proveedores{
  var property montoFijoPorSector  

  method precioPor(fiesta) = self.precioBase(fiesta) + self.precioExtra(fiesta)
  method precioBase(fiesta) =  montoFijoPorSector * fiesta.cantidadDeSectores()
  method precioExtra(fiesta) = 0
}
 class Salon inherits Proveedores {
  override method precioBase(fiesta)= super(fiesta)* fiesta.duracion()
}

class Organizadores inherits Proveedores{
  var property recargo  = 0.2

  override method precioExtra(fiesta) =  
    if (fiesta.esComplicada()) self.precioBase(fiesta) * recargo else 0
}

class EquiposMozos inherits Proveedores(montoFijoPorSector = 0){
  var property cantidadMozosPorSector 
  const horaPorMozo = 50

  override method precioBase(fiesta) = 
    cantidadMozosPorSector * horaPorMozo * fiesta.duracion() * fiesta.cantidadDeSectores()
}
class Seguridad inherits Proveedores (montoFijoPorSector = 100){ 
  var property recargo 
  
  method aplicarRecargo(fiesta) = self.precioBase(fiesta) * recargo 
  override method precioExtra(fiesta) =  
    if (fiesta.esLarga()) self.aplicarRecargo(fiesta)  else 0
}
object losTilos inherits Salon(montoFijoPorSector = 500){}
object marta inherits Organizadores(montoFijoPorSector = 600){}
object eliana inherits Organizadores(montoFijoPorSector = 1500){}

object losPibes inherits EquiposMozos(cantidadMozosPorSector = 2){}
object dodain inherits EquiposMozos(cantidadMozosPorSector = 3){}
object escudo inherits Seguridad(recargo = 0.1){}
object silvina inherits Seguridad(recargo = 0.25){}

// Clientes y la contratacion - Punto 3 (Integrante 3)
class Servicio {
  const property proveedor
  const property monto
}
class Cliente {
  var ahorro 
  const property porcentajePresupuesto
  const property fiesta 
  const serviciosContratados = []

  method ahorro() = ahorro

  method ahorra(monto) {
    ahorro += monto
  }

  method presupuesto() = ahorro * porcentajePresupuesto

   method contratarProveedor(proveedor) {
    const montoProveedor = proveedor.precioPor(fiesta)
     if(montoProveedor > self.presupuesto()){
         throw new DomainException(message = "Presupuesto insuficiente")
    }
      serviciosContratados.add(new Servicio(proveedor = proveedor, monto = montoProveedor))
      ahorro -= montoProveedor
  }

  method cantidadGastada() = serviciosContratados.sum({servicio => servicio.monto()})
  method cantidadDeServiciosContratados() = serviciosContratados.size()
  method servicioCaro() = serviciosContratados.any({servicio => servicio.monto() > 3000})
  method esDerrochon() = self.servicioCaro()
  method proveedoresContratados() = serviciosContratados.map({servicio => servicio.proveedor()}).asSet()
}
class ClienteFiestero inherits Cliente {
    override method esDerrochon() = self.servicioCaro() && !fiesta.esLarga()
}

// Fixturee Y Agencia - Punto Grupal 
class Agencia {
  const proveedores = []

  method incorporarProveedor(proveedor) { 
    proveedores.add(proveedor)
  }
  method desvincularProveedor(proveedor) { 
    proveedores.remove(proveedor)
  }
  method costoProveedor(cliente) = proveedores.filter({
    proveedor => proveedor.precioPor(cliente.fiesta()) <= cliente.presupuesto()})
}

object fixtureCompartido {
  method nuevaFiestaIsabella() = new Fiesta(sectores = [
                                  new SectorPorGrupos(grupos = 3, integrantesPorGrupo = 4, acompaniantesPorGrupo = 2), 
                                  new SectorPorMesa(mesas = 6, invitadosPorMesa = 4)] , 
                                  duracion = 4) 
  method nuevaFiestaMilena() = new Fiesta(sectores = [
                                  new SectorPorMesa(mesas = 3, invitadosPorMesa = 4),
                                  new SectorPorGrupos(grupos = 2, integrantesPorGrupo = 3, acompaniantesPorGrupo = 1)] , 
                                  duracion = 6) 
  method nuevaFiestaDamian() = new Fiesta(sectores = [
                                  new SectorPorMesa(mesas = 6, invitadosPorMesa = 5),
                                  new SectorPorMesa(mesas = 5, invitadosPorMesa = 4),
                                  new SectorPorGrupos(grupos = 2, integrantesPorGrupo = 5, acompaniantesPorGrupo = 0),
                                  new SectorPorGrupos(grupos = 4, integrantesPorGrupo = 2, acompaniantesPorGrupo = 2)] , 
                                  duracion = 8) 
  method NuevaFiestaTomas() = new Fiesta(sectores = [
                                  new SectorPorMesa(mesas = 6, invitadosPorMesa = 4), 
                                  new SectorPorGrupos(grupos = 3, integrantesPorGrupo = 4, acompaniantesPorGrupo = 2)] , 
                                  duracion = 4) 

  method nuevaIsabella() = new Cliente(ahorro = 2750, porcentajePresupuesto = 0.6, fiesta = self.nuevaFiestaIsabella())
  method nuevaMilena()   = new Cliente(ahorro = 2000, porcentajePresupuesto = 0.2, fiesta = self.nuevaFiestaMilena())
  method nuevoDamian()   = new ClienteFiestero(ahorro = 250000, porcentajePresupuesto = 0.2, fiesta = self.nuevaFiestaDamian())
  method nuevoTomas()    = new ClienteFiestero(ahorro = 250000, porcentajePresupuesto = 0.2, fiesta = self.NuevaFiestaTomas())

  method nuevaAgencia() = new Agencia(proveedores = 
                                 [losTilos, marta, eliana, losPibes, dodain, escudo, silvina, 
                                 doniaRosa, elBodegon, pizzasNico] )
}
