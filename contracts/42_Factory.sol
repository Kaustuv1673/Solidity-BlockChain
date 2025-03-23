// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Factory{
    Computer[] public arr;
    function instance() public{
        Computer obj=new Computer();
        arr.push(obj);
    }

    function ComputerInfo() public view returns(Computer[] memory){
        return arr;
    }
}

contract Computer{

}