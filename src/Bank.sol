// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Bank is Ownable {
    uint256 public immutable withdrawalBlock;
    mapping(address => uint256) addressToDepositedValue;

    constructor() {
        withdrawalBlock = block.number + 5;
    }

    function deposit() public payable {
        require(msg.value > 0, "Must despoit more than 0");
        addressToDepositedValue[msg.sender] += msg.value;
    }

    function getDepositByAddress(address _address) public view returns (uint256) {
        return addressToDepositedValue[_address];
    }

    function withdraw() public onlyOwner {
        require(block.number >= withdrawalBlock, "Too early to withdraw");
        (bool success,) = msg.sender.call{value: address(this).balance}("");
        require(success, "Transfer failed.");
    }
}
