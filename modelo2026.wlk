// -------------------------------------------------------------------------------------------------------------------
//                                      Operacion Transparencia - 2025
// -------------------------------------------------------------------------------------------------------------------

// TEMA 1

// Punto 1

class Juez{
    const property nombre
}
const rodolfo = new Juez(nombre = "Dr.Rodolfo Kometa")
const armando = new Juez(nombre = "Dr. Armando U. Nacausa")
const jorge   = new Juez(nombre = "Dr. Jorge Garantis")
class Causa{
    const titulo
    const jueces = []
    var property montoBase

    method perjuicioEconomicoTotal() = montoBase + self.extraPorCausa()
    method extraPorCausa() 
    method aumentarMontoBase(monto) { montoBase += monto }

}

class Soborno inherits Causa{
    var hayArrepentidos
    override method extraPorCausa() = if (hayArrepentidos) 1 else 2
   
}

class ObraPublica inherits Causa(montoBase = 3, jueces = [rodolfo, armando , jorge]){
    override method extraPorCausa() = if (self.largoJueces()) 2 else 0
    method largoJueces() = jueces.size()<=2 // lo puede tener como atributo 
}

class Compleja inherits Causa{
    const subCausas = []

    method agregarSubCausa(causa) { subCausas.add(causa) }
    override method extraPorCausa() = subCausas.sum(
        {subCausas => subCausas.extraPorCausa()}
    )
}

object ejecutivo {

  method puedeComerse(funcionario, causa) = funcionario.tieneJuezAmigoEn(causa)
  method aceptaTalCual(propuesta) =
    propuesta.any({palabra => propuesta.contienePalabraClave(palabra)})
}

object ministro {
  method puedeComerse(funcionario, causa) {
    if (funcionario.patrimonio() > causa.perjuicioEconomico() * 0.5 )
      throw new Exception(message = "Ministro con patrimonio menor al 50% del perjuicio")
  }
  method aceptaTalCual(propuesta) = propuesta.esPedidoCorto()
}

class Propuesta {
  var property descripcion
  var property fechaPresentacion
  var property fechaCumplimiento
  var property palabrasClave = ["aumento", "impuestos", "inflación"]

  method esPedidoCorto() = fechaCumplimiento.year() < fechaPresentacion.year(1) 

  method contienePalabraClave(palabraClave) {
    descripcion.contains(palabraClave)
  }
}

class Promesa {
  const property descripcion
  const property fechaCumplimiento
}
class Funcionario {
  var property patrimonio
  var property puesto
  const causas = []
  const juecesAmigos = []
  const promesas = []
  method agregarJuezAmigo(juez) { juecesAmigos.add(juez) }
  method tieneJuezAmigoEn(causa) = causa.jueces().any({juez => juecesAmigos.contains(juez)})

  method puedeComerse(causa) = patrimonio > 0 && puesto.puedeComerse(self, causa)

  method comerseCausa(causa) {
    if (!self.puedeComerse(causa)) {
      throw new DomainException(message = "El funcionario no puede comerse esta causa")
    }
    causas.add(causa)
  }

  method causasQueDejanPegado() = causas.filter({causa => causa.perjuicioEconomico() > 5})

  method salirEnMedios() {
    causas.forEach({causa => causa.aumentarMontoBase(0.1)})
  }

  method escucharPropuesta(propuesta) {
    const fecha =
      if (puesto.aceptaTalCual(propuesta)) propuesta.fechaCumplimiento()
      else propuesta.fechaPresentacion().plusYears(4)
    promesas.add(new Promesa(descripcion = propuesta.descripcion(), fechaCumplimiento = fecha))
  }
}


