// Licencia
// SPDX-License-Identifier: LGPL-3.0-only

// Version
pragma solidity 0.8.35;

// Contrato
contract ContratoTest {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

}