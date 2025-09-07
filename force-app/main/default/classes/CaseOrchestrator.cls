public with sharing class CaseOrchestrator {
    // Private constructor since only static methods are used
    private CaseOrchestrator() {}

    /**
     * Returns the current status of a Case by CaseNumber.
     * @param caseNumber The CaseNumber of the Case.
     * @return The Status of the Case, or null if not found.
     * @throws IllegalArgumentException if caseNumber is null or empty.
     */
    @AuraEnabled(cacheable=true)
    public static String getCaseStatusByNumber(String caseNumber) {
        if (String.isBlank(caseNumber)) {
            throw new IllegalArgumentException('Case Number cannot be null or empty.');
        }
        List<Case> cases = [SELECT Status FROM Case WHERE CaseNumber = :caseNumber LIMIT 1];
        if (cases.isEmpty()) {
            return null;
        }
        return cases[0].Status;
    }
}