// SPDX-Licence-Identifier:MIT
pragma solidity >=0.7.0 <0.9.0;

contract Conditional{
    uint public num;

    function check1(bool value) public{
        require(value==true,"Not true");
        num=100;
    }

    function check2(bool value) public returns(string memory){
        if(value==true){
            num=100;
        }else{
            return "Not true";
        }
    }
}