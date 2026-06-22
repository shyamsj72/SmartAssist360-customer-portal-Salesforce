public with sharing class AIResolutionService {

    public static void generateResolution(Id caseId) {

        Http http = new Http();
        HttpRequest req = new HttpRequest();

        req.setEndpoint(
            'https://dummyjson.com/c/9eb4-94b4-4ccc-89cb'
        );

        req.setMethod('GET');

        HttpResponse res = http.send(req);

        if(res.getStatusCode() == 200){

            Map<String,Object> result =
                (Map<String,Object>)
                JSON.deserializeUntyped(
                    res.getBody()
                );

            Map<String,Object> data =
                (Map<String,Object>)
                result.get('data');

            AI_Resolution_Log__c log =
                new AI_Resolution_Log__c();

            log.Case__c = caseId;

            log.Prompt__c =
                'Generate AI Resolution';

            log.Response__c =
                String.valueOf(
                    data.get('response')
                );

            log.Confidence_Score__c =
                Decimal.valueOf(
                    String.valueOf(
                        data.get('confidenceScore')
                    )
                );

            log.Resolution_Status__c =
                String.valueOf(
                    data.get('resolutionStatus')
                );

            log.AI_Agent_Name__c =
                'SmartAssist AI';

            log.Tokens_Used__c = 150;

            log.Response_Time_Seconds__c = 2;

            log.Created_By_AI__c = true;

            insert log;

        } else {

            System.debug(
                'Callout Failed: ' +
                res.getStatusCode() +
                ' ' +
                res.getBody()
            );
        }
    }

    @InvocableMethod(
        label='Generate AI Resolution'
    )
    public static void runAI(
        List<Id> caseIds
    ){

        for(Id caseId : caseIds){
            generateResolution(caseId);
        }
    }
}