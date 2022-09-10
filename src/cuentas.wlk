object cuentaCorriente {
	var saldo = 0
	
	method depositar(valor) {saldo += valor}
	method extraer(valor) {saldo -= valor}
	method saldo() = saldo
}

object cuentaConGastos {
	var saldo = 0
	method depositar(valor) {saldo += valor - 20}
	method extraer(valor) {
		if (valor <= 1000) saldo -= valor + 20	
		else saldo -= valor * 1.02
	}
	method saldo() = saldo
}

object cuentaCombinada {
	var property cuentaPrimaria = cuentaCorriente
	var property cuentaSecundaria = cuentaConGastos
	
	method depositar(valor) {cuentaPrimaria.depositar(valor)}
	method extraer(valor) {
		if(cuentaPrimaria.saldo() >= valor) cuentaPrimaria.extraer(valor)
		else cuentaSecundaria.extraer(valor)
	}
	method saldo() = cuentaPrimaria.saldo() + cuentaSecundaria.saldo()
}

