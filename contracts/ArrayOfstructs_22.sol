// SPDX-Licence-Identifier:GPL -3.0
pragma solidity >=0.5.0 < 0.9.0;

contract Struct{
    struct Student{
      string name;
      uint roll;
      bool pass;
    }

    Student[5] public s;

    function insert(uint index,string calldata _name,uint _roll,bool _pass)public{
        s[index].name=_name;
        s[index].roll=_roll;
        s[index].pass=_pass;
    }
    // Student public s1; 

    // function insert(string calldata _name,uint _roll,bool _pass)public{
    //     s1.name=_name;
    //     s1.roll=_roll;
    //     s1.pass=_pass;
    // }

    // function getterRoll() public view returns(uint){
    //     return s1.roll;
    // }

    // function getterName() public view returns(string memory){
    //     return s1.name;
    // }

    // function getter() public view returns(Student memory){
    //     return s1;
    // }
}
