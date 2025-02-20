// SPDX-Licence-Identifier:GPL -3.0
pragma solidity >=0.5.0 < 0.9.0;

contract StringConcatenation{
    function concatenateStrings(string calldata s1,string calldata s2) public pure returns(string memory){
        return string.concat(s1,s2);
    }
}