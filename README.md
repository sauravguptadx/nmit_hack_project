# nmit_hack_project
This is the project for NMIT Hackathon

## About the Project idea

For long, different e-voting systems have been provided with the goal of increasing security and minimizing cost. Blockchain is a major breakthrough in the technological industry that provide immense secured platform. With the launch of Ethereum, a decentralized platform which runs decentralized applications (DApps) on it, a secured voting system now seems possible. Many organizations have now shifted their focus on voting through blockchain platforms. There’s a very high chance that a normal voting method won’t lead to a clear majority. There can be many ways to deal with this issue which includes another voting process to take place which can be quite expensive in terms of time and resources. In our paper, we introduce the vote-trading concept where the votes can be redistributed to other candidates in case if there is no clear majority and also this ‘ majority’ factor can be set by the organization according to their requirement.

### Objectives

We implement the blockchain based preferential e-voting system using the Solidity programming language where instead of one vote per candidate, we provide the concept of giving preference to the candidates.

### Implementation 

Once the user enters the credentials correctly, i.e., the user is successfully able to log in into system, the user would be directed to the voting portal. In the voting portal, there would be a list of candidates. The voter needs to give preference to the candidates with the lowest number given to the most preferred candidate and the largest number given to the least preferred candidate.

In our system, each preferred list by a voter is taken as one transaction. Thus whenever a user or voter gives preference to the candidates and submit his list, a transaction is added to the blockchain network. As we know, to submit a transaction in Ethereum blockchain, a user needs to provide some fuel or some amount of gas. In Ethereum, the gas or fuel is called Ether. In our system, the chairperson or the admin of the system will provide one Ether to each voter to cast his/her vote. Thus, each voter would be able to cast only one vote. There would be no other way through which a voter could earn an Ether and cast his vote again. Thus, we have at most one response from each voter and each response is stored as transaction and submitted to the blockchain network. These transactions make up a block which is added to the blockchain by miners.

We define a variable majority, where the organization decides a certain percentage to be a clear majority. This variable is not fixed and different organization can provide different values according to the need of their ‘clear majority’. The votes are counted, and if we have a clear majority as defined by the organization, then our system will declare the winner. But since there is high probability that in such voting process, there usually isn’t a winner with clear majority, instead of going for a second voting process, in our system, the votes of the last candidate are distributed according to the preferences given by the voters for that candidate. Thus, the last candidate is removed from the competition and its votes distributed to other candidates according to the preferences given in the votes of the eliminating candidates. This process continues as long as we don’t get a clear majority winner. As we discussed before, a clear majority is a variable that is defined by the organization or the chairperson or the admin according to their need of ‘clear majority’.

Applications As blockchain provides immense security, our e-voting system can be used for organizations where security is major concern as there are hackers trying to manipulate such online voting system. The hackers would not be able to carry out DoS attacks as blockchain is a distributed network. Ethereum is a distributed platform that allows us to deploy such decentralized applications.


## Functions in PreferenceVoting.sol

Have added comments in the code itself for better understanding.
Explaining brief about some main and important0 functions.

It contains struct of Candidate and Voter which basically contains some property which can be seen in the code.
Voter struct has property **uint[] voting_preferncing** which basically stores the preferences of the candidates. The candidate at 0th index is given the highest priority while the candidate at the last index is given lowest priority.

We have **add_candidate()** function which adds a new candidate to stand in the voting contest. Initially, the vote count of each candidate is set to 0.

In **set_majority()** function, the owner of the contract sets the majority for which a candidate must have atleast that percentage of votes to win the election.

In **give_voting_rigths()** function, the organizer gives voting rights to certain addresses or users. Only these addresses/users can vote.

Currently implementing function are **vote()**, **count_votes** and **redistribute_votes()**
In **vote()**, the users or the voters will give preferences to the candidates and submit their vote.

In **count_votes**, we find the number of votes casted for each candidate, find the candidate with maximum votes and find the one with minimum votes.

In **redistribute_votes()**, in case we don’t have a clear majority, the votes of the last candidate are distributed according to the preferences given by the voters for that candidate. The last candidate is removed from the competition and its votes distributed to other candidates according to the preferences given in the votes of the eliminating candidates. This function is called as long as we don’t get a clear majority winner.
