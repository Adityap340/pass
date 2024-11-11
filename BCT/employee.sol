//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract EmployeeData {

    struct Employee {
        uint id;
        string name;
        uint age;
        string position;
        uint salary;
    }

    Employee[] public employees;
    
    event EmployeeAdded(uint id, string name, uint age, string position, uint salary);
    event ReceivedEther(address indexed sender, uint value);

    function addEmployee(uint id, string memory name, uint age, string memory position, uint salary) public {
        employees.push(Employee(id, name, age, position, salary));
        emit EmployeeAdded(id, name, age, position, salary);
    }

    function getEmployeeById(uint id) public view returns (string memory name, uint age, string memory position, uint salary) {
        for (uint i = 0; i < employees.length; i++) {
            if (employees[i].id == id) {
                Employee storage employee = employees[i];
                return (employee.name, employee.age, employee.position, employee.salary);
            }
        }
        revert("Employee not found");
    }

    function getEmployeeCount() public view returns (uint){
        return employees.length;
    }

    receive() external payable {
        emit ReceivedEther(msg.sender, msg.value);
    }

    fallback() external payable {
        emit ReceivedEther(msg.sender, msg.value);
    }

}
