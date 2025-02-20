// SPDX-Licence-Identifier:GPL -3.0
pragma solidity >=0.5.0 < 0.9.0;

contract requireStatement{
    //condition checking
    //true-move on to next line of code
    //false-revert back and throw error

    // bool public valid;

    uint public a=10;
    uint public b=20;
    uint public c=30;
    uint public d=40;

    function isEven(uint x) public{
        //code
        // valid=true;

        a=100;
        b=200;
        c=300;
        require(x%2==0,"x is an odd number");
        d=400;
    }    
}
