// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Shop {
    string public str = 'asd asd assd';
    string public str1 = "asd asd asd";
    address public owner;
    mapping (address => uint) public payments;
    bool public myBool;
    enum Status { Paid, Delivered, Received }
    Status public currentStatus;
    uint[3][2] public items;
    bytes32 public myBytes = 'Hello';
    bytes public cyrillic = unicode"привет мир";
    bytes public latin = "hello world";
    struct Payment {
        uint amount;
        uint timestamp;
        address from;
        string message;
    }

    struct Balance {
        uint totalPayments;
        mapping(uint => Payment) payments2;
    }

    mapping(address => Balance) public balances;

    function getPayment(address addr, uint index) public view returns (Payment memory) {
        return balances[addr].payments2[index];
    }

    function pay(string memory message) public payable {
        uint paymentsNum = balances[msg.sender].totalPayments;
        balances[msg.sender].totalPayments++;

        Payment memory newPayment = Payment(
            msg.value,
            block.timestamp,
            msg.sender,
            message
        );
        balances[msg.sender].payments2[paymentsNum] = newPayment;
    }

    function checkLengthCyrillic() public view returns (uint) {
        uint lenCyrillic = cyrillic.length;
        return lenCyrillic;
    }

    function checkLengthLatin() public view returns (uint) {
        uint lenLatin = latin.length;
        return lenLatin;
    }

    function arr() public {
        items = [
            [1,2,3],
            [4,5,6]
        ];
    }

    function tempArr() public pure returns (uint[] memory) {
        uint[] memory tempArray = new uint[](10);
        tempArray[0] = 10;
        return tempArray;
    }

    function paid() public {
        currentStatus = Status.Paid;
    }

    function delivered() public {
        currentStatus = Status.Delivered;
    }

    function received() public {
        currentStatus = Status.Received;
    }

    constructor() {
         owner = msg.sender; 
    }

    function receiveFunds() public payable  {
        payments[msg.sender] = msg.value;
    }

    function getBalance(address targetAddress) public view returns (uint) {
        return targetAddress.balance;
    }

    function transferTo(address targetAddress, uint amount) public payable  {
        address payable _to = payable(targetAddress);
        _to.transfer(amount);
    }

    function payForItem() public payable  {
         payments[msg.sender] = msg.value;
    }

    function withdrawAll() public {
        address payable _to = payable(owner);
        address _thisContract = address(this);
        _to.transfer(_thisContract.balance);
    }
}