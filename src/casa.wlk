import cosas.* 

object casaDePepeYJulian {
	const cosas = []
	var cuenta = cuentaCorriente
	
	method cosas() = cosas
	method comprar(cosa) {cosas.add(cosa)}
	method cantidadDeCosasCompradas() = cosas.size()
	method tieneComida() = cosas.any({cosa=>cosa.esComida()})
	method vieneDeEquiparse() = 
		cosas.last().esElectrodomestico() || cosas.last().precio() > 5000
		
	method esDerrochona() = cosas.sum({cosa=>cosa.precio()}) > 9000
	method compraMasCara() = cosas.max({cosa=>cosa.precio()})
	method electrodomesticosComprados() = cosas.filter({cosa=>cosa.esElectrodomestico()})
	method malaEpoca() = cosas.all({cosa=>cosa.esComida()})
	method queFaltaComprar(lista) = 
		lista.asSet().difference(cosas.asSet())
	method faltaComida() = cosas.count({cosa=>cosa.esComida()}) < 2
		
	method gastoEnComida() = self.comidaComprada().sum({c=>c.precio()})
	method comidaComprada() = cosas.filter({c=>c.esComida()})
	
	method hayElectrodomesticosBaratos() = 
		self.electrodomesticosComprados().any({e=>e.precio() < 3000})
		
	method preciosDeElectrodomesticos() = 
		self.electrodomesticosComprados().map({e=>e.precio()})
		
	method nivelEnAumento() = cosas.last().precio() >= cosas.first().precio() * 2
	
	method primeraComidaComprada() = self.comidaComprada().first()
	
	method primeraComidaPlus() = 
		cosas.findOrDefault({c=>c.esComida()},"No se compro comida aun")
	
	
}