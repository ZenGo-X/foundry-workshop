// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "src/Bank.sol";

contract BankScript is Script {
    Bank bank;
    
    function run() public {
        vm.startBroadcast();

        vm.stopBroadcast();
    }
}
