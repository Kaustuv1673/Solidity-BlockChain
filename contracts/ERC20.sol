// SPDX-Licence-Identifier:MIT
pragma solidity >=0.5.0 <0.9.0;

interface  IERC20{
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recepient,uint amount) external returns (bool);
    function allowance(address owner,address spender) external view returns (uint256);
    function approve(address spender,uint256 amount) external returns (bool);
    function transferFrom(address sender,address recepient,uint256 amount) external returns (bool);

    event Transfer(address indexed from,address indexed to,uint256 value);
    event Approval(address indexed owner,address indexed spender,uint256 value);
    event Burning(address indexed founder,uint256 value);
}

contract Block is IERC20{
   string public name="Block";//name of the token
   string public symbol="BLK";//symbol of the token 
   uint public decimal=0;//we will talk about this at the end
   address public founder;//initially this will have the total supply
   uint public totalSupply;
   bool public stopAllFunctions;

   mapping(address=>mapping(address=>uint)) allowed;
   mapping(address=>uint) public balances;
   mapping(address=>bool) public isFreeze;

   modifier founderOnly{
      require(msg.sender==founder,"You are not the founder");
      _;
   }

   modifier notFreeze{
     require(isFreeze[msg.sender]==false,"Your account is freezed");
     _;
   }

   modifier emergencyStatus(){
      require(stopAllFunctions==false,"Emergency is declared");
      _;
   }

   constructor(){
     founder=msg.sender;
     totalSupply=1000;
     balances[founder]=totalSupply;
   }
   
   function balanceOf(address account) external view emergencyStatus() returns (uint256){
      return balances[account];
   }
    
   //google pay by scanning
   function transfer(address recepient,uint256 amount) external emergencyStatus() notFreeze() returns(bool){
     require(amount>0,"Amount must be greater than zero");
     require(balances[msg.sender]>=amount,"You don't have enough balance");
     balances[msg.sender]-=amount;
     balances[recepient]+=amount;
     emit Transfer(msg.sender,recepient,amount);
     return true;
   }

   function allowance(address owner,address spender) external view emergencyStatus() returns(uint256){
       return allowed[owner][spender];
   }
   
   //writing a cheque
   function approve(address spender,uint256 amount) external emergencyStatus() notFreeze() returns (bool){
      require(amount>0,"Amount must be greater than 0");
      require(balances[msg.sender]>=amount,"You don't have sufficient balance");
      allowed[msg.sender][spender]=amount;
      emit Approval(msg.sender,spender,amount);
      return true;
   }
   
   //encashing a cheque
   function transferFrom(address sender,address recepient,uint256 amount) external emergencyStatus() returns(bool){
      require(amount>0,"Amount must be greater than 0");
      require(balances[sender]>=amount,"You don't have sufficient balance");
      require(allowed[sender][recepient]>=amount,"You don't have enough allowance for this transaction");
      balances[sender]-=amount;
      balances[recepient]+=amount;
      allowed[sender][recepient]-=amount;
      return true;
   }   

   //burning - founder will have authority to destroy tokens
   //freeze account - to stop an account to make any transfer
   //emergency - all the functions will stop working

   function burning(uint256 value) public founderOnly() {
       require(value<=totalSupply,"Not enough tokens to burn");
       balances[founder]-=value;
       totalSupply-=value;
       emit Burning(msg.sender,value);
   }

   function freeze(address freezingAddress)public founderOnly(){
       isFreeze[freezingAddress]=true;
   }

   function unfreeze(address freezingAddress)public founderOnly(){
      isFreeze[freezingAddress]=false;
   }

   function declareEmergency() public founderOnly(){
      stopAllFunctions=true;
   }

   function callOffEmergency() public founderOnly(){
     stopAllFunctions=false;
   }
}