// -------------------------------------------------------------------------------------------------------------------
//                                            Herencia
// -------------------------------------------------------------------------------------------------------------------
class Cliente { 
    method cuantoPaga(importeTotal) { 
        return importeTotal + self.cuantoDePropina(importeTotal) 
    } 
    method cuantoDePropina(importeTotal)
}

class ClienteFeliz inherits Cliente { 
    override method cuantoDePropina(importeTotal) = importeTotal * 0.25 
}
class ClienteEnojado inherits Cliente { 
    override method cuantoDePropina(importeTotal) = 0 
} 
class ClienteIndiferente inherits Cliente { 
    var property plataDelBolsillo 

    override method cuantoDePropina(importeTotal) = plataDelBolsillo 
}

// const juanRoman = new ClienteFeliz()

/*
¿Qué ocurre si luego de un tiempo juanRoman pasa a estar triste? 
Tenemos que crear una nueva instancia.
Nos trae problemas el tener que copiar todo el estado o quienes referenciaban al objeto 
que representaba al cliente feliz, ahora tienen que referenciar a la nueva instancia de cliente triste.
*/