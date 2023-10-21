import circuits.collateral as CollateralCircuit

function test_sufficient_collateral() {
    let threshold = 1000;

    let sufficient_proof = CollateralCircuit::SufficientCollateral {
        input_amount: 500, 
        threshold: threshold, 
        actual_amount: 1500, 
        is_sufficient: false
    };
    
    console.assert(sufficient_proof.validate() == true);
}

function test_insufficient_collateral() {
    let threshold = 1000;

    let insufficient_proof = CollateralCircuit::SufficientCollateral {
        input_amount: 500, 
        threshold: threshold, 
        actual_amount: 900, 
        is_sufficient: false
    };
    
    console.assert(insufficient_proof.validate() == false);
}

function main() {
    test_sufficient_collateral();
    test_insufficient_collateral();
}
