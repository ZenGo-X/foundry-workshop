// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/test.sol";
import "src/Bank.sol";

contract BankTest is Test {
    Bank bank;

    function setUp() public {
        bank = new Bank();
    }

    function testWithdrawalBlock() public {
        assertEq(bank.withdrawalBlock(), block.number + 5);
    }
}