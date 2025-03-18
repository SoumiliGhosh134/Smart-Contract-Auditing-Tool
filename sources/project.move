module MyModule::AuditTool {

    use aptos_framework::signer;
    use std::string;

    /// Struct to store audit results.
    struct AuditReport has store, key {
        result: string::String,  // Audit result summary
        risk_level: u8,          // Risk level (0 - 10 scale)
    }

    /// Function to submit an audit report.
    public fun submit_audit(owner: &signer, result: string::String, risk_level: u8) {
        let report = AuditReport {
            result,
            risk_level,
        };
        move_to(owner, report);
    }

    /// Function to get the audit report of a smart contract.
    public fun get_audit_report(auditor: address): AuditReport acquires AuditReport {
        borrow_global<AuditReport>(auditor)
    }
}
