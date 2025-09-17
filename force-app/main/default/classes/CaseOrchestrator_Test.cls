/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 *
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class CaseOrchestrator_Test {
  @isTest
  static void testGetCaseStatusReturnsCorrectStatus() {
    Case testCase = new Case(
      Status = 'New',
      Origin = 'Phone',
      Subject = 'Test'
    );
    insert testCase;
    // Query the inserted case to get the auto-generated CaseNumber
    Case insertedCase = [
      SELECT CaseNumber, Status
      FROM Case
      WHERE Id = :testCase.Id
      LIMIT 1
    ];
    Map<String, Object> result = CaseOrchestrator.getCaseStatusByNumber(
      insertedCase.CaseNumber
    );
    System.assertEquals('New', result.get('status'), 'Status should be New');
  }

  @isTest
  static void testGetCaseStatusWithInvalidCaseNumberReturnsNotFound() {
    Map<String, Object> result = CaseOrchestrator.getCaseStatusByNumber(
      '999999'
    ); // unlikely to exist
    System.assertEquals(
      'Case not found',
      result.get('status'),
      'Should return "Case not found" for invalid CaseNumber'
    );
  }

  @isTest
  static void testGetCaseStatusWithNullCaseNumberThrowsException() {
    try {
      CaseOrchestrator.getCaseStatusByNumber(null);
      System.assert(
        false,
        'Exception should have been thrown for null CaseNumber'
      );
    } catch (Exception e) {
      System.assertEquals(
        'Case Number cannot be null or empty.',
        e.getMessage()
      );
    }
    try {
      CaseOrchestrator.getCaseStatusByNumber('');
      System.assert(
        false,
        'Exception should have been thrown for empty CaseNumber'
      );
    } catch (Exception e) {
      System.assertEquals(
        'Case Number cannot be null or empty.',
        e.getMessage()
      );
    }
  }
}
