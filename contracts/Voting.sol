// SPDX-Licence-Identifier:GPL -3.0
pragma solidity >=0.5.0 < 0.9.0;

contract Vote{
    struct Voter{
        string name;
        uint age;
        uint voterId;
        string gender;
        uint voteCandidateId;//candidate id to whom voter has voted
        address voterAddress;
    }

    struct Candidate{
        string name;
        string party;
        uint age;
        string gender;
        uint candidateId;
        address candidateAddress;
        uint votes;//number of votes to a candidate
    }
    address electionCommision;
    address public winner;

    uint nextVoterId=1;//Voter Id for voters
    uint nextCandidateId=1;//Candidate Id for candidates

    uint startTime;//Start time of election
    uint endTime;//End time for election

    mapping(uint => Voter) voterDetails;//Details of voters 
    mapping(uint => Candidate) candidateDetails;//Details of candidates
    bool stopVoting;//Thus is for an emergency situation to stop voting

    constructor(){
       electionCommision=msg.sender;
    }

    modifier isVotingOver(){
        require(block.timestamp<endTime && stopVoting==false,"Voting is over")
        _;
    }

    modifier onlyCommissioner(){
        require(msg.sender==electionCommision,"You are not from Election Commision");
        _;
    }

    function candidateRegister(string calldata _name,string calldata _party,uint _age,
    string calldata _gender) external {
        require(_age>=18,"Age is under 18");
        require(candidateVerification(msg.sender),"You have already registered");
        require(nextCandidateId<5,"Candidate registration full");
        candidateDetails[nextCandidateId]=Candidate({
            name:_name,
            party:_party,
            age:_age,
            gender:_gender,
            candidateId:nextCandidateId,
            candidateAddress:msg.sender,
            votes:0
        });
        nextCandidateId++;
    }

    function candidateVerification(address _person) internal view returns (bool){
        for(uint i=1;i<nextCandidateId;i++){
            if(candidateDetails[i].candidateAddress==_person)
               return false;
        }
        return true;
    }

    function candidateList() public view returns(Candidate[] memory){
        Candidate[] memory candidateArr=new Candidate[](nextCandidateId-1);
        for(uint i=1;i<nextCandidateId;i++){
            candidateArr[i-1]=candidateDetails[i];//transferring data from mapping to array
        }
        return candidateArr;
    }

    function voterRegister(string calldata _name,uint _age,string calldata _gender) public{
        require(_age>=18,"Age is under 18");
        require(voterVerification(msg.sender),"Voter already registered");
        voterDetails[nextVoterId]=Voter({
            name:_name,
            age:_age,
            gender:_gender,
            voterId:nextVoterId,
            voterAddress:msg.sender,
            voteCandidateId:0
        });
        nextVoterId++;
    }

    function voterVerification(address _person) internal view returns(bool){
        for(uint i=1;i<nextVoterId;i++){
            if(voterDetails[i].voterAddress==_person)
              return true;
        }
        return false;
    }

    function voterList() public view returns(Voter[] memory){
        Voter[] memory voterArr=new Voter[](nextVoterId-1);
        for(uint i=1;i<nextVoterId;i++){
            voterArr[i-1]=voterDetails[i];
        }
        return voterArr;
    }

    function vote(uint _voterId,uint _candidateId) external isVotingOver(){
        //vote should be allowed only when voting has started
        //voting should only happen when atleast two candidates have registered
        //one vote one voter 
        require(startTime!=0,"Voting has not started");
        require(nextCandidateId>=3,"Not enough candiates have registered");
        require(_voterId>0 && _voterId<nextVoterId, "You are not registered as a voter");
        require(voterDetails[_voterId].voteCandidateId==0,"You have already voted");
        require(_candidateId>0 && _candidateId<nextCandidateId,"The person you want to vote is not a registered candidate");
        voterDetails[_voterId].voteCandidateId=_candidateId;
        candidateDetails[_candidateId].votes++; 
    }
 
    function voteTime(uint _startTime,uint duration) external onlyCommissioner(){
        startTime=_startTime;// 4pm
        endTime=_startTime+duration;//6 pm
    }

    function votingStatus() public view returns(string memory){
        if(startTime==0)
           return "Voting has not started";
        else if(block.timestamp<endTime && stopVoting==false)
           return "Voting in progress";
        else 
          return "Voting has ended";
    }

    function result() external onlyCommissioner(){
        uint maxVotes;
        uint winnerId; 
        for(uint i=1;i<nextCandidateId;i++){
            if(candidateDetails[i].votes>maxVotes){
                maxVotes=candidateDetails[i].votes;
                winnerId=i;
            }
        }
        winner=candidateDetails[winnerId].candidateAddress;
    }

    function emergency() public onlyCommissioner(){
        stopVoting=true;
    }
}
//server side-
//registration and voting date check at server side