public class CaseTriggerHandler {

    public static void beforeUpdate(
        List<Case> newCases,
        Map<Id, Case> oldMap
    ) {

        for(Case c : newCases) {

            Case oldCase = oldMap.get(c.Id);

            if(c.Status == 'Escalated' &&
               oldCase.Status != 'Escalated') {

                c.Resolved_Date__c = Date.today();

                Decimal hours =
                    (System.now().getTime() - c.CreatedDate.getTime())
                    / (1000.0 * 60 * 60);

                c.Resolution_Time_Hours__c = hours;
            }
        }
    }

    public static void afterUpdate(
        List<Case> newCases,
        Map<Id, Case> oldMap
    ) {

        List<Case_Comment_History__c> comments =
            new List<Case_Comment_History__c>();

        for(Case c : newCases) {

            Case oldCase = oldMap.get(c.Id);

            if(c.Status == 'Escalated' &&
               oldCase.Status != 'Escalated') {

                comments.add(
                    new Case_Comment_History__c(
                        Case__c = c.Id,
                        Comment__c = 'Case escalated automatically.',
                        Commented_By__c = UserInfo.getUserId(),
                        Comment_Date__c = System.now(),
                        Comment_Type__c = 'System'
                    )
                );
            }
        }

        if(!comments.isEmpty()) {
            insert comments;
        }
    }
}