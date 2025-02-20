// SPDX-Licence-Identifier:GPL -3.0
pragma solidity >=0.7.0 <0.9.0;

contract MemVsSto{
    uint[5] public arr=[1,2,3,4,5];

    function StorageKeyword() public {
        uint[5] storage brr;
        brr=arr;//brr act as pointer to arr
        brr[0]=6;
    }

    function MemoryKeyword() public view{
        uint[5] memory crr;
        crr=arr;//crr will be a copy of arr
        crr[0]=6;
    }

    function searchElement() public view returns(bool){
        uint[5] memory brr=arr;
        for(uint i=0;i<5;i++){
            if(brr[i]==5)
              return true;
        }
        return false;
    }
}