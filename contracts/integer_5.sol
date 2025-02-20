// SPDX-Licence-Identifier:GPL -3.0
pragma solidity 0.8.0;

contract integer{
    // uint256 public num1=256;
    uint8 public num2=255;

    function uncheck() public{
        unchecked{
            num2++;
        }
    }
}