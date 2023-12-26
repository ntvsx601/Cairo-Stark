# Import necessary libraries
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.serialize import serialize_word
from starkware.cairo.common.cairo_builtins import HashBuiltin

@storage_var
func proposals(proposal_id: felt) -> (res: Proposal):
    ...

struct Proposal:
    id: felt
    vote_count: felt
    description: felt
    deadline: felt

func create_proposal{syscall_ptr : felt*, range_check_ptr}(proposal_id: felt, description: felt, deadline: felt):
    let (proposal) = proposals.read(proposal_id=proposal_id)
    if proposal.id != 0:
        return ()
    
    proposals.write(proposal_id=proposal_id, value=Proposal(
        id=proposal_id,
        vote_count=0,
        description=description,
        deadline=deadline,
    ))
    return ()

func update_vote_count{syscall_ptr : felt*, range_check_ptr}(proposal_id: felt):
    let (proposal) = proposals.read(proposal_id=proposal_id)
    if proposal.id == 0:
        return ()

    proposals.write(proposal_id=proposal_id, value=Proposal(
        id=proposal.id,
        vote_count=proposal.vote_count + 1,
        description=proposal.description,
        deadline=proposal.deadline,
    ))
    return ()

func get_proposal_details{syscall_ptr : felt*, range_check_ptr}(proposal_id: felt) -> (res: Proposal):
    let (proposal) = proposals.read(proposal_id=proposal_id)
    return (proposal,)
