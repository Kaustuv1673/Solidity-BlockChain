// SPDX-Licence-Identifier:MIT
pragma solidity >=0.5.0 <0.9.0;

contract EmployeeRegistry{
    struct Employee{
        uint id;
        string name;
        uint salary; 
    }

    Employee[] public e;

    function addEmployee(uint _id,string calldata _name,uint _salary) public {
        e.push(Employee(_id,_name,_salary));
    }

    function getEmployee(uint _id) public view returns(uint){
        for(uint i=0;i<e.length;i++){
           if(e[i].id==_id)
             return e[i].salary;
        }
        return 0;
    }
}