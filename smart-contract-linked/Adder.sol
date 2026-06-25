// Licencia
// SPDX-License-Identifier: LGPL-3.0-only

// Version
pragma solidity 0.8.35;

import "./interfaces/IResult.sol";

//Contrato
contract Adder {

    //Inicializar objeto: interfaz + address
    address public address_result;


    constructor(address address_result_) {
        address_result = address_result_;
    }

    function addition(uint256 num1_, uint256 num2_) external {
        uint256 result = num1_ + num2_;

        IResult(address_result).setResult(result);
    }

    function setFee(uint256 newFee_) external {
        IResult(address_result).setFee(newFee_);
    }

}