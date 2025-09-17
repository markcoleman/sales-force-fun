public with sharing class CaseOrchestrator {
    // Private constructor since only static methods are used
    private CaseOrchestrator() {}

    /**
     * Returns the current status of a Case by CaseNumber.
     * @param caseNumber The CaseNumber of the Case.
     * @return A map containing the status of the Case, or a message indicating the Case was not found.
     * @throws IllegalArgumentException if caseNumber is null or empty.
     */
    @AuraEnabled(cacheable=true)
    public static Map<String, Object> getCaseStatusByNumber(String caseNumber) {
        Map<String, Object> result = new Map<String, Object>();
        if (String.isBlank(caseNumber)) {
            throw new IllegalArgumentException('Case Number cannot be null or empty.');
        }
        List<Case> cases = [SELECT Status FROM Case WHERE CaseNumber = :caseNumber LIMIT 1];
        if (cases.isEmpty()) {
            result.put('status', 'Case not found');
        } else {
            result.put('status', cases[0].Status);
        }
        return result;
    }
}