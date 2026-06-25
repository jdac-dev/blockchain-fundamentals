// Licencia
// SPDX-License-Identifier: LGPL-3.0-only

// Version
pragma solidity 0.8.35;

//Contrato
contract Result {

    address public admin;
    uint256 public result;
    uint256 public fee;


    constructor(address admin_) {
        admin = admin_;
        fee = 5; // Inicializamos el fee con valor por defecto
    }

    function setResult(uint num_) external {
        result = num_;
    }

    //Funcion para modiificar fee, ya que el contrato al modificar no se puede modificar el codigo
    //La idea es poder modificar el fee solo por admin, por seguridad
    function setFee(uint256 newFee_) external {
        //if(msg.sender != admin) revert(); //Test con msg.sender
        if(tx.origin != admin) revert(); //Test con tx.origin para ver diferencias entre ellas
        
        fee = newFee_;
    }
}