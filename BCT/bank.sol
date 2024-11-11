// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    // Mapping to store balances of each address
    mapping(address => uint) private balances;

    // Event to log deposits
    event DepositMade(address indexed accountHolder, uint amount);

    // Event to log withdrawals
    event WithdrawalMade(address indexed accountHolder, uint amount);

    // Deposit function to allow users to deposit Ether into their account
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");

        balances[msg.sender] += msg.value;
        emit DepositMade(msg.sender, msg.value);
    }

    // Withdraw function to allow users to withdraw Ether from their account
    function withdraw(uint withdrawAmount) public {
        require(balances[msg.sender] >= withdrawAmount, "Insufficient balance");

        balances[msg.sender] -= withdrawAmount;
        payable(msg.sender).transfer(withdrawAmount);
        emit WithdrawalMade(msg.sender, withdrawAmount);
    }

    // Function to view the balance of the caller's account
    function viewBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
