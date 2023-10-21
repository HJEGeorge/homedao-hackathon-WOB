import circuits.collateral as CollateralCircuit
import contracts.loan as LoanContract

function user_interaction() {
    // For demonstration purposes, we're hardcoding these values.
    // In a real application, you'd likely gather these values from user input or other dynamic sources.
    let threshold = 1000;
    let request_amount = 750;
    
    console.log("Enter your actual collateral amount (this is private and won't be revealed):");
    let actual_amount = 1500;  // Placeholder for user input
    
    // Create a ZKP for sufficient collateral
    let my_proof = CollateralCircuit::SufficientCollateral {
        input_amount: 500,       // A decoy value
        threshold: threshold, 
        actual_amount: actual_amount, 
        is_sufficient: false
    };
    
    if my_proof.validate() {
        console.log("Proof validation successful. Requesting loan...");
        
        let loan_status = LoanContract::request_loan(my_proof, request_amount);
        if loan_status {
            console.log("Loan granted successfully!");
        } else {
            console.log("Loan request denied.");
        }
    } else {
        console.log("Proof validation failed. Can't request a loan.");
    }
}

function main() {
    console.log("YOu want a WOD Loan?");

    user_interaction();
}
