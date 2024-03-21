pragma solidity >=0.4.22 <0.9.0;

contract Vote {
    
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(address => bool) public voters;

    mapping(uint => Candidate) public candidates;
    Candidate[] public candidateArray; 
    uint public candidatesCount;

    event votedEvent (
        uint _candidateId
    );

    
    constructor () {
        addCandidate("Anh");
        addCandidate("Thao");
        addCandidate("Ha");
    }

    function addCandidate(string memory _name) public {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(uint(candidatesCount), _name, 0);
        candidateArray.push(Candidate(uint(candidatesCount), _name, 0)); 
    }

    function vote (uint _candidateId) public {
        require(!voters[msg.sender]);
        require(_candidateId >= 0 && _candidateId <= candidatesCount);
        voters[msg.sender] = true;
        candidateArray[_candidateId].voteCount ++;
        emit votedEvent(_candidateId);
    }

    function getCandidates() public view returns (Candidate[] memory) {
        return candidateArray;
    }
    
}


// pragma solidity >=0.4.22 <0.9.0;

// contract Vote {
//     struct Candidate {
//         uuint id;
//         string name;
//         uuint voteCount;
//     }

//     mapping(address => bool) public voters;
//     mapping(uint => Candidate) public candidates;
//     uint[] public candidateIds;
//     uint public candidatesCount;

//     event votedEvent(uint indexed _candidateId);

//     constructor () {
//         addCandidate("The Anh");
//         addCandidate("Thao");
//         addCandidate("Ha");
//     }

//     function addCandidate(string memory _name) public {
//         candidatesCount++;
//         candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
//         candidateIds.push(candidatesCount);
//     }

//     function vote(uint _candidateId) public {
//         require(!voters[msg.sender], "Already voted");
//         require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID");
//         voters[msg.sender] = true;
//         candidates[_candidateId].voteCount++;
//         emit votedEvent(_candidateId);
//     }

//     function getCandidateIds() public view returns (uint[] memory) {
//         return candidateIds;
//     }

//     function getCandidateById(uint _candidateId) public view returns (uint, string memory, uint) {
//         require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID");
//         Candidate memory candidate = candidates[_candidateId];
//         return (candidate.id, candidate.name, candidate.voteCount);
//     }
// }
