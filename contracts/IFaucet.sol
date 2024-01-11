// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// они не могут наследовать от других смарт-контрактов
// они могут наследовать только от других интерфейсов
// они не могут объявлять переменные состояния
// они не могут объявить конструктор
// все функции должны быть внешними (external)

interface IFaucet {
    function addFunds() external payable;

    function withdraw(uint withdrawAmount) external;
}
