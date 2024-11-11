// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyBank {
    mapping(address => uint) private _balances;
    address public owner;
    event LogDepositMade(address accountHolder, uint amount);

    constructor() {
        owner = msg.sender;
        _balances[owner] = 1000; // Set an initial balance for the owner
        emit LogDepositMade(msg.sender, 1000);
    }

    // Deposit function to add Ether to the user's balance
    function deposit() public payable returns (uint) {
        require(msg.sender != address(0), "Invalid address");
        require(
            (_balances[msg.sender] + msg.value) > _balances[msg.sender],
            "Deposit failed"
        );
        
        _balances[msg.sender] += msg.value;
        emit LogDepositMade(msg.sender, msg.value);
        return _balances[msg.sender];
    }

    // Withdraw function to withdraw Ether from the user's balance
    function withdraw(uint withdrawAmount) public returns (uint) {
        require(_balances[msg.sender] >= withdrawAmount, "Insufficient balance");
        require(msg.sender != address(0), "Invalid address");
        
        _balances[msg.sender] -= withdrawAmount;
        payable(msg.sender).transfer(withdrawAmount); // Cast to payable
        emit LogDepositMade(msg.sender, withdrawAmount);
        return _balances[msg.sender];
    }

    // View function to check the balance of the caller
    function viewBalance() public view returns (uint) {
        return _balances[msg.sender];
    }
}
