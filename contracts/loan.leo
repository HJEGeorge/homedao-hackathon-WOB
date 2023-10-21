@contract
struct LoanContract {
    collateral_proof: SufficientCollateral,
    loan_amount: u32
}

@public
function request_loan(proof: SufficientCollateral, request_amount: u32) -> bool {
    if proof.validate() {
        // Grant the loan
        self.loan_amount = request_amount;
        return true;
    } else {
        return false;
    }
}




