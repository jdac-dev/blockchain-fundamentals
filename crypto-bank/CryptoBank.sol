// SPDX-License-Identifier: LGPL-3.0-only

pragma solidity 0.8.35;

//Functions:
    //1. Deposit ether
    //2. Withdraw ether
    //3. Modify balance

//Rules:
    //1. Multiuser
    //2. Only can deposit ether
    //3. User can only withdraw previously deposited ether
    //4. Max balance = 5 ether
    //5. Max balance modifiaable by owner

contract Cryptobank {

    //Variables
    uint256 public maxBalance;
    address public admin;
    mapping (address => uint256) public userBalance;

    //Events
    event EtherDeposit(address user_, uint256 etherAmount_);
    event EtherWithdraw(address user_, uint256 etherAmount_);

    //Modifiers
    modifier onlyAdmin() {
        require(msg.sender == admin, "Not Allowed");
        _;
    }

    constructor(uint256 maxBalance_, address admin_) {
        maxBalance = maxBalance_;
        admin = admin_;
    }

    //Functions

    //1. Deposit
    function depositEther() external payable{
        require(userBalance[msg.sender] + msg.value <= maxBalance, "MaxBalance reached");
        
        userBalance[msg.sender] += msg.value;

        emit EtherDeposit(msg.sender, msg.value);
    }

    //2. Withdraw
    //With CEI Pattern: 1. Checks 2. Effects 3. Interactions
    function withdrawEther(uint256 amount_) external {
        require(amount_ <= userBalance[msg.sender], "Not enough ether");

        userBalance[msg.sender] -= amount_;

        (bool success,) = msg.sender.call{value: amount_}("");
        require(success, "Transfer failed");

        emit EtherWithdraw(msg.sender, amount_);
    }

    //3. Modify maxBalance
    function modifyMaxBalance(uint256 newMaxBalance_) external onlyAdmin {
        maxBalance = newMaxBalance_;
    }

}