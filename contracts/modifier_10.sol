// SPDX-Licence-Identifier:MIT
pragma solidity >=0.7.0 <0.9.0;

contract Modifier{
    uint public num=10;

    modifier onlyValid(bool value){
        require(true==value,"Not valid");
        num=1;
        _;
    }

    function check1(bool value) public onlyValid(value){
        num=100;
    }

    function check2(bool value) public onlyValid(value){
        num=200;
    }

    function check3(bool value) public onlyValid(value){
        num=300;
    }
}