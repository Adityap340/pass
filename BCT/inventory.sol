// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductInventory {
    
    struct Product {
        string name;
        uint quantity;
    }

    mapping(uint => Product) public products;
    uint public productCount;

    // Function to receive products
    function receiveProduct(string memory _name, uint _quantity) public {
        productCount++;
        products[productCount] = Product(_name, _quantity);
    }

    // Function to sell products
    function sellProduct(uint _id, uint _quantity) public {
        require(_id > 0 && _id <= productCount, "Invalid Product ID");
        require(products[_id].quantity >= _quantity, "Not enough stock");
        products[_id].quantity -= _quantity;
    }

    // Function to display stock
    function displayStock(uint _id) public view returns (string memory, uint) {
        require(_id > 0 && _id <= productCount, "Invalid Product ID");
        return (products[_id].name, products[_id].quantity);
    }
}
