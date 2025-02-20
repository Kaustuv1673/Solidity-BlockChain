// SPDX-Licence-Identifier:GPL -3.0
pragma solidity >=0.5.0 < 0.9.0;

contract Twitter{
    struct Tweet{
        uint id;
        address author;
        string content;
        uint createdAt;
    }

    struct message{
        uint id;
        string content;
        address from;
        address to;
        uint createdAt;
    }

    mapping(uint=>Tweet) public Tweets;
    mapping(address=>message[]) public messages;
    mapping(address=>uint[]) public TweetsOf;
    mapping(address=>address[]) public following;
    mapping(address=>address[]) public followers;
    mapping(address=>mapping(address=>bool)) public operators;

    uint nextId;
    uint nextMessageId;

    function _tweet(address _from,string memory _content) internal{
        Tweets[nextId]=(Tweet(nextId,_from,_content,block.timestamp));
        TweetsOf[_from].push(nextId);
        nextId++;
    }

    function _sendMessage(address _from,address _to,string memory _content) internal{
        messages[_from].push(message(nextMessageId,_content,_from,_to,block.timestamp));
        nextMessageId++;
    }

    function tweet(string memory _content) public{//owner
        _tweet(msg.sender,_content);
    }

    function tweet(address _from,string memory _content) public{//owner -> address access
        _tweet(_from,_content);
    }

    function sendMessage(address _to,string memory _content) public{//owner
        _sendMessage(msg.sender,_to,_content);
    }

    function sendMessage(address _from,address _to,string memory _content) public{//owner -> address access
       _sendMessage(_from, _to, _content);
    }

    function  follow(address _followee) public{
        followers[_followee].push(msg.sender);
        following[msg.sender].push(_followee);
    }

    function  follow(address _follower,address _followee) public{
        followers[_followee].push(_follower);
        following[_follower].push(_followee);
    }

    function allow(address _operator)public{
         operators[msg.sender][_operator]=true;
    }

    function disallow(address _operator)public{
        operators[msg.sender][_operator]=false;
    }

    function getLatestTweets(uint count) public view returns (Tweet[] memory){
        require(count>0 && count<=nextId,"Count is not proper");
        Tweet[] memory _tweets=new Tweet[](count);

        uint j;

        for(uint i=nextId-count;i<nextId;i++){
            Tweet storage _structure=Tweets[i];
            _tweets[j]=Tweet(_structure.id,_structure.author,_structure.content,_structure.createdAt);
            j++;
        }
        return _tweets;
    }

    function getLatestTweetsOfUser(address _user,uint count) public view returns(Tweet[] memory){
        require(count>0 && count<= TweetsOf[_user].length,"Count is not proper");
        Tweet[] memory _tweets=new Tweet[](count);
 
        uint j;

        for(uint i=TweetsOf[_user].length-count;i<TweetsOf[_user].length;i++){
              uint tweetId=TweetsOf[_user][i];
              Tweet storage _structure=Tweets[tweetId];
             _tweets[j++]=Tweet(_structure.id,_structure.author,_structure.content,_structure.createdAt);
        }

        return _tweets;
    }
     
}