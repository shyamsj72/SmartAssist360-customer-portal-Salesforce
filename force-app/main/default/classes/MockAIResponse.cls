@isTest
global class MockAIResponse implements HttpCalloutMock {

    global HTTPResponse respond(HTTPRequest req) {

        HttpResponse res = new HttpResponse();

        res.setHeader(
            'Content-Type',
            'application/json'
        );

        res.setStatusCode(200);

        res.setBody(
        '{"success":true,"data":{"caseNumber":"00001015","customerTier":"Platinum","category":"Billing","severity":"Critical","sentiment":"Negative","rootCause":"Configuration Issue","confidenceScore":98,"recommendedTeam":"Billing Team","resolutionStatus":"Escalated","response":"Billing issue reviewed and escalated to Level 2 Support."}}'
        );

        return res;
    }
}