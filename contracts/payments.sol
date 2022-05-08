// SPDX-License-Identifier: MIT 
 
pragma solidity ^0.8.0; 
 
contract Demo { 
    struct Payment { 
        uint amount; 
        uint time; 
        address from; 
        string message; 
    } 
 
    struct Balance { 
        uint totalPayments; 
        mapping (uint => Payment) payments; 
    } 
 
    mapping (address => Balance) public balences; 

    function currentBalance() public view returns(uint) {
        return address(this).balance;
    }
 
    function getPayment(address _addr, uint _index) public view returns(Payment memory){ 
        return balences[_addr].payments[_index]; 
    } 
 
    function pay(string memory message) public payable { 
        uint paymentsNum = balences[msg.sender].totalPayments++; 
        balences[msg.sender].totalPayments++; 
 
        Payment memory newPayment = Payment ( 
            msg.value, 
            block.timestamp, 
            msg.sender, 
            message 
        ); 
 
        balences[msg.sender].payments[paymentsNum] = newPayment; 
    } 
}