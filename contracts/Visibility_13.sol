// SPDX-Licence-Identifier:MIT
pragma solidity >=0.7.0 <0.9.0;

contract Demo{
    function f1() public pure returns(uint){
        return 1;
    }

    function f2() private pure returns(uint){
        return 2;
    }

    function f3() external pure returns(uint){
        return 3;
    }

    function f4() internal pure returns(uint){
        return 4;
    }
}

contract otherContract{
    Demo obj=new Demo();
    uint public x=obj.f3();
}

// contract Child is Demo{
//     function returnValue() public pure returns(uint){
//         return f3();
//     }
// }