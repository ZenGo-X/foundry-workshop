// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "src/Bank.sol";

contract BankTest is Test {
    Bank bank;

    function setUp() public {
        bank = new Bank();
    }

    function testWithdrawalBlock() public {
        assertEq(bank.withdrawalBlock(), block.number + 5);
    }

    function testDeposit() public {
    }

    function testWithdraw() public {
    }

    function testWithdrawFail() public {
    }

    function testWithdrawOnlyOwner() public {
    }

    function testFuzzDeposit(uint16 _value) public {
    }

}
