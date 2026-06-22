@isTest
public class AIResolutionServiceTest {

    @isTest
    static void testGenerateResolution() {

        Case c = new Case(
            Subject='API Test',
            Status='New',
            Origin='Web'
        );

        insert c;

        Test.setMock(
            HttpCalloutMock.class,
            new MockAIResponses()
        );

        Test.startTest();

        AIResolutionService.generateResolution(
            c.Id
        );

        Test.stopTest();

        List<AI_Resolution_Log__c> logs = [

            SELECT Id,
                   Response__c,
                   Resolution_Status__c
            FROM AI_Resolution_Log__c
            WHERE Case__c = :c.Id
        ];

        System.assertEquals(
            1,
            logs.size()
        );

        System.assertEquals(
            'Escalated',
            logs[0].Resolution_Status__c
        );
    }
}