// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Company{
    mapping(string=>CEO) public arr;
    function createObject() public{
        arr["CEO"]=new CEO();
    }
}

contract CEO{

}

contract HR{

}

contract Manager{

}
