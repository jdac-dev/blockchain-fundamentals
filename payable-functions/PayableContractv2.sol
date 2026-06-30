// SPDX-License-Identifier: LGPL-3.0-only

pragma solidity 0.8.35;

contract PayableContract {

    //1 ether = 1*10^18 wei
    //"function" + name + arguments + visibility + payable? + modifiers + return value
    function sendEther() public payable {}

    function withdrawEther(uint256 amount) public {
        // recipient + call + ether value + data
        (bool success, /*bytes memory data*/) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
    }
} 