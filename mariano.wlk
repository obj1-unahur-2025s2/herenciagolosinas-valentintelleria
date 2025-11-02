import golosinas.*

object mariano {
	var golosinas = []
	 
	method comprar(_golosina) { golosinas.add(_golosina) }
	
	method desechar (_golosina) { golosinas.remove(_golosina) }
	
	method golosinas() { return golosinas }
	method primerGolosina() { return golosinas.first() }
	method ultimaGolosina() { return golosinas.last() }

	method pesoGolosinas() { 
		return golosinas.sum({ golo => golo.peso() })
	}
	
	method probarGolosinas() {
		golosinas.forEach( {_golosina => _golosina.mordisco() } )
	}
	
	method golosinaMasPesada() { 
		return golosinas.max({ golo => golo.peso() })
	}
	
	method hayGolosinaSinTACC() {
		return golosinas.any({ _golosina => _golosina.libreGluten()}) 
	}
	
	method preciosCuidados() {
		return golosinas.all({ _golosina => _golosina.precio() < 10}) 
	}
	
	
	
	method golosinaDeSabor(_sabor) {
		return golosinas.find({ golosina => golosina.sabor() == _sabor })
	}
	
	method golosinasDeSabor(_sabor) {
		return golosinas.filter({ golosina => golosina.sabor() == _sabor })
	}
	
	method sabores() {
		return golosinas.map({ golosina => golosina.sabor() }).asSet()
	}



	method golosinaMasCara() {
		return golosinas.max( { _golosina => _golosina.precio() } )
	}

	method golosinasFaltantes(golosinasDeseadas) {
		return golosinasDeseadas.difference(golosinas)	
	}


	method saboresFaltantes(_saboresDeseados) {
		return _saboresDeseados.filter({_saborDeseado => ! self.tieneGolosinaDeSabor(_saborDeseado)})	
	}
	
	method tieneGolosinaDeSabor(_sabor) {
		return golosinas.any({_golosina => _golosina.sabor() == _sabor})
	}

	method comprarBombon() { golosinas.add(new Bombon()) }
	method comprarChocolatin(pesoDeChocolatin) { golosinas.add(new Chocolatin(pesoInicial = pesoDeChocolatin)) }
	method comprarCaramelo(unSabor) { golosinas.add(new Caramelo(sabor = unSabor )) }
	method comprarAlfajor() { golosinas.add(new Alfajor()) }
	method comprarChupetin() { golosinas.add(new Chupetin()) }
	method comprarOblea() { golosinas.add(new Oblea()) }
	method comprarGolosinaBaniada(golosinaABaniar) { golosinas.add(new GolosinaBaniada(golosinaInterior = golosinaABaniar)) }
	method comprarTuttifrutti(libreDeGlutenTrueOFalse) { golosinas.add(new Tuttifrutti(libreDeGluten = libreDeGlutenTrueOFalse)) }

	method baniar(unaGolosina) {
		self.comprarGolosinaBaniada(unaGolosina)
	}
}