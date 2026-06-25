// Licencia
// SPDX-License-Identifier: LGPL-3.0-only

// Version
pragma solidity 0.8.35;

//Las interfaces solo pueden contener funciones externals, 
//ya que se tienen que acceder desde otro contrato
interface IResult {
    function setResult(uint num_) external; 
    function setFee(uint256 newFee_) external;
}