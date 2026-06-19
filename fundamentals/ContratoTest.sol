// Licencia
// SPDX-License-Identifier: LGPL-3.0-only

// Version
pragma solidity 0.8.24;

// Contrato
contract ContratoTest {

// Numeros
uint256 num1 = 115792089237316195423570985008687907853269984665640564039457584007913129639935; // [0 - 2^256-1]
uint16 num2 = 256;// [0 - 2^256-1]
uint8 num3 = 127; // [-2^7 - 2^7-1]
uint32 result = num2 * num3;

// String
string palabra = "Hola mundo";

// Boleans
bool test = true;
bool test2 = false;

// Array
uint256[5] arraytest = [1, 2, 3, 4, 5];

// mapping
mapping(address => uint256) example23;

// Structs
struct Person {
    string name;
    uint256 age;
}

// modificadores
modifier modificador1 {
    if (5 + 2 != 10) revert();
    _;
}

// eventos
event Multiplicacion(uint256 resultado);


// functiones

// External
// palabra (function) + nombre + argumentos + visibilidad + modificadores + valor devuelto
// Visibilidad:
    // - external
    // - internal 
    // - public
    // - private

function multiplier(uint256 num1_, uint256 num2_) public modificador1 returns(uint256 resultado) {
    resultado = num1_ * num2_;

    emit Multiplicacion(resultado);
    return resultado;
}

// Internal


}