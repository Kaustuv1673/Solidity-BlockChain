// SPDX-Licence-Identifier:MIT
pragma solidity >=0.7.0 <0.9.0;

contract newContract{
    //coding
    uint public num1=5; //num- state variable
    //permanently stored on blockchain
    //gas cost is associated with state variables
    //saved on storage
    //reading cost of state variable is zero
    //writing a state variable cost you gas

    function changeState() public{
        num1=10;
    }

    function localVariableSetter() public{
        uint num2=10; //num2 - local variable - stored in stack
    }
}