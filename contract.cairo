# Importing necessary libraries
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.serialize import serialize_word

# Declare the Struct for a Voter
struct Voter:
    is_registered: felt
    has_voted: felt
    voted_proposal_id: felt

# Declare the Struct for a Proposal
struct Proposal:
    id: felt
    vote_count: felt

# Main contract class
@contract_interface
namespace IMyVotingContract:
    func register_voter(voter_id: felt) -> (): 
        ...

    func create_proposal(proposal_id: felt) -> ():
        ...

    func vote(voter_id: felt, proposal_id: felt) -> ():
        ...

    func tally_votes() -> (winning_proposal_id: felt):
        ...
end

# The contract implementation
@storage_var
func voters(voter_id: felt) -> (res: Voter):
    ...

@storage_var
func proposals(proposal_id: felt) -> (res: Proposal):
    ...

func register_voter{syscall_ptr : felt*, range_check_ptr}(voter_id: felt):
    # Implementation for registering a voter
    ...

func create_proposal{syscall_ptr : felt*, range_check_ptr}(proposal_id: felt):
    # Implementation for creating a proposal
    ...

func vote{syscall_ptr : felt*, range_check_ptr}(voter_id: felt, proposal_id: felt):
    # Implementation for casting a vote
    ...

func tally_votes{syscall_ptr : felt*, range_check_ptr}() -> (winning_proposal_id: felt):
    # Implementation for tallying votes and returning the winning proposal
    ...
