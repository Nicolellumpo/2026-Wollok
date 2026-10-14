// -------------------------------------------------------------------------------------------------------------------
//                                            Composicion
// -------------------------------------------------------------------------------------------------------------------

class Cliente { 
    var property humor 

    method cuantoPaga(importeTotal) { 
        return importeTotal + self.cuantoDePropina(importeTotal) 
    } 
    method cuantoDePropina(importeTotal) = humor.cuantoDePropina(importeTotal)
}

object feliz { 
    method cuantoDePropina(importeTotal) = importeTotal * 0.25 
}

object enojado { 
    method cuantoDePropina(importeTotal) = 0 
} 

class Indiferente { 
    var property plataDelBolsillo 

    method cuantoDePropina(importeTotal) = plataDelBolsillo 
}

/*
Cuando creamos a juanRoman, ahora es necesario asignarle un estado de humor. 
Pero para que ahora cambie a estar enojado, solamente es necesario ejecutar:

juanRoman.humor(enojado)
*/