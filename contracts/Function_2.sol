// SPDX-Licence-Identifier:MIT
pragma solidity >=0.5.0 <0.9.0;

contract Function{
    //code
    uint num1=10;
    uint num2=20;
  
    uint public value=10;//automatically solidity will create a getter function for it
    uint public randomValue=100;
    function addition() public pure{
        uint a=10;
        uint b=20;
        uint c;
        c=a+b;
    }

    function subtraction() public pure returns(uint){
        uint a=10;
        uint b=20;
        return b-a;
    }

    //view-reading state variable
    function multiplication() public view returns(uint){
        return num1*num2;
    }

    //pure-no relation with state variable
    function div(uint a,uint b) public pure returns(uint){
        return a/b;
    }
   
    //neither view nor pure-write on the state variable
    function changeState() public {
        num1=100;//write
    }
}