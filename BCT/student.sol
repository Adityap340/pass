// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract StudentRegistry {
    struct Student {
        string name;
        uint256 age;
        uint256 rollNumber;
    }

    Student[] private students;

    event StudentAdded(string name, uint256 age, uint256 rollNumber);

    event ReceivedEther(address indexed sender, uint256 value);

    fallback() external payable{
        emit ReceivedEther(msg.sender, msg.value);
    }

    function addStudent(string memory name, uint256 age, uint256 rollNumber) public{
        students.push(Student(name,age,rollNumber));
        emit StudentAdded(name, age, rollNumber);
    }

    function getStudent(uint256 index) public view returns (string memory, uint256, uint256){
        require(index < students.length, "Student not found");
        return(students[index].name, students[index].age, students[index].rollNumber);
    }

    function getStudentCount() public view returns (uint256) {
        return students.length;
    }
    receive() external payable{
        emit ReceivedEther(msg.sender, msg.value);
    }
}