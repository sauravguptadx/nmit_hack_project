pragma solidity ^0.4.0;

contract PrefVoting{
    
    // imformation about the candidates standing in the election
    struct Candidate
    {
        string candidate_name;  // name of the candidate or the party
        uint vote_count;        // vote counts for this candidate
    }
    
    
    struct Voter
    {
        bool voted;                 // has the voter already voted ?
        bool has_voting_rights;     //does the voter has voting rights ? 
        uint [] voting_preferencing;       // the voter gives prefernces to the candidates
                                          // the preferences are stored in an array, with candidate at 0th index has highest preference
                                          // while the candiate at the last index has the lowest preference
    }
    
    address public organizer;           // address of the organizer/owner/admin of the contract
    
    uint public majority_percentage;    // define the majority for a candidate to win
                                        // the candidate must have atleast that percentage of votes
    
    string public election_name;        // since the voting can be used for multiple purposes/ we give a name to the election
    
    mapping(address => Voter) public voters; // key value pair so that each user with address is mapped to Voter struct
    
    Candidate[] public candidates;      // list of all the candidates who stood up for voting
    

    constructor(string ename, uint majority) public {   
        organizer = msg.sender;         // msg.sender here is the one who calles the function
                                        // since its an constructor function, the one who deploys the Smart Contract is the sender
        election_name = ename;
        majority_percentage = majority;
    }
    
    // function to add a candidate in the election
    function add_candidate(string cname) public {
        require(msg.sender == organizer, "Only organizer is allowed to add candidates"); // only the organizer is alllowed to add candidate
        
        candidates.push(Candidate(cname, 0));       // we add candidate to the candidates list with its name and vote count initialized to 0
    }
    
    // function to set the majority if required to change the majority
    function set_majority(uint majority) public
    {
        require(msg.sender == organizer, "Only organizer is allowed to set the winning majority"); // only the organizer can set or change the majority
        majority_percentage = majority;
    }
    
    
    // function to return the list of candidates
    function get_number_of_candidates() public view returns(uint)
    {
        return candidates.length;
    }
    
    
    // function to give voting rights to voter/users
    function give_voting_rights(address voter) public
    {
        require(msg.sender == organizer, "Only organizer is allowed to give voting rights");
        
        voters[voter].has_voting_rights = true;     // set the has_voting_rights property of voter to true;
                                                    // this gives the user to have voting rights
     
    }
    
}