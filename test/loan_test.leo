import circuits.collateral as CollateralCircuit
import contracts.loan as LoanContract

function test_successful_loan_request() {
    let threshold = 1000;
    
    let sufficient_proof = CollateralCircuit::SufficientCollateral {
        input_amount: 500, 
        threshold: threshold, 
        actual_amount: 1500, 
        is_sufficient: false
    };
    
    let loan_status = LoanContract::request_loan(sufficient_proof, 750);
    console.assert(loan_status == true);
}

function test_failed_loan_request() {
    let threshold = 1000;
    
    let insufficient_proof = CollateralCircuit::SufficientCollateral {
        input_amount: 500, 
        threshold: threshold, 
        actual_amount: 900, 
        is_sufficient: false
    };
    
    let loan_status = LoanContract::request_loan(insufficient_proof, 750);
    console.assert(loan_status == false);
}

function main() {
    test_successful_loan_request();
    test_failed_loan_request();
}
