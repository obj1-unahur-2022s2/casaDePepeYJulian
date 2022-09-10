object heladera {
	method precio() { return 20000 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object cama {
	method precio() { return 8000 }
	method esComida() { return false }
	method esElectrodomestico() { return false }	
}

object tiraDeAsado {
	method precio() { return 350 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object paqueteDeFideos {
	method precio() { return 50 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object plancha {
	method precio() { return 1200 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object milanesas {
	var property precio = 260
	
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object salsa {
	var property precio = 90
	
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object microondas {
	method precio() { return 4200 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object cebollas {
	method precio() { return 25 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object compu {
	method precio() { return 500 * dolar.cotizacion() }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object dolar {
	var property cotizacion = 300
}

object packComida {
	var plato
	var aderezo
	const platosPermitidos = [tiraDeAsado, paqueteDeFideos,milanesas]
	const aderezosPermitidos = [salsa,cebollas]

	method configurarPackComida(unPlato,unAderezo) {
		if (!platosPermitidos.contains(unPlato)) self.error("No es un plato valido")
		if (!aderezosPermitidos.contains(unAderezo)) self.error("No es un aderezo permitido")
		plato = unPlato
		aderezo = unAderezo
	}
	
	method precio() { return plato.precio() + aderezo.precio() }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object packRegalo {
	const componentes = []
	
	method agregarComponente(componente) {componentes.add(componente)}
	method agregarComponentes(listaComponentes) {componentes.addAll(listaComponentes)}
	method quitarComponente(componente) {componentes.remove(componente)}
	method precio() = componentes.sum({c=>c.precio()}) * 0.8
	method esComida() = componentes.all({c=>c.esComida()})
	method esElectrodomestico() = componentes.any({c=>c.esElectrodomestico()})	
}
