@isTest
public class CaseTriggerHandlerTest {

    @isTest
    static void testCaseClosedUpdatesFields() {

        Case testCase = new Case(
            Subject = 'Test Case',
            Status = 'New',
            Origin = 'Web'
        );

        insert testCase;

        testCase.Status = 'Working';
        update testCase;

        Test.startTest();

        testCase.Status = 'Escalated';
        update testCase;

        Test.stopTest();

        Case updatedCase = [
            SELECT Status
            FROM Case
            WHERE Id = :testCase.Id
        ];

        System.assertEquals(
            'Escalated',
            updatedCase.Status
        );
    }
}