// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Owned.sol";
import "./Logger.sol";
import "./IFaucet.sol";

contract Faucet is Owned, Logger, IFaucet {
    uint public numOfFunders;

    mapping(address => bool) private funders;
    mapping(uint => address) private lookUpTableFunders;

    modifier withdrawLimit(uint withdrawAmount) {
        require(
            withdrawAmount <= 1000000000000000000,
            "Can not withdraw more than 1 ETH."
        );
        _;
    }

    // переменные хранилища
    // address[] public funders;

    // специальная функция
    // вызывается когда нужно провести транзакцию
    // external функции могут быть вызваны в других транзакциях
    receive() external payable {}

    function emitLog() public pure override returns (bytes32) {
        return "Hello";
    }

    function ownerTest() external onlyOwner {}

    function changeOwner(address newOwner) external onlyOwner {
        owner = newOwner;
    }

    function addFunds() external payable override {
        // uint index = numOfFunders++;
        // funders[index] = msg.sender;
        // funders.push(msg.sender);
        address funder = msg.sender;

        if (!funders[funder]) {
            uint index = numOfFunders++;
            funders[funder] = true;
            lookUpTableFunders[index] = funder;
        }
    }

    function withdraw(
        uint withdrawAmount
    ) external override withdrawLimit(withdrawAmount) {
        payable(msg.sender).transfer(withdrawAmount);
    }

    function getAllFunders() public view returns (address[] memory) {
        address[] memory _funders = new address[](numOfFunders);

        for (uint i = 0; i < numOfFunders; i++) {
            _funders[i] = lookUpTableFunders[i];
        }

        return _funders;
    }

    function getFunderAtIndex(uint8 index) external view returns (address) {
        // address[] memory _funders = getAllFunders();
        return lookUpTableFunders[index];
    }

    // Транзакции могут генерировать изменение хранилища и требуют gas
    // pure, view - вызывается только для чтения, gas fee = 0
    // view function - это указывает на то, что функция в любом случае не изменит состояние
    // хранилища
    // pure function - даже не будет читать состояние хранилища
}

// 60 80 60 40 52 34 80 15 60 0f 57 60 00 80 fd 5b 50 60 45 80 60 1d 60 00 39 60 00 f3 fe
// const instance = await Faucet.deployed()

// instance.addFunds({from: accounts[0], value: 2000000000000000000})

// instance.withdraw("500000000000000000", { from: accounts[1] })

// instance.getFunderAtIndex(0)
// instance.getAllFunders()
