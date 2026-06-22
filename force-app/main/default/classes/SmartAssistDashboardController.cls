public with sharing class SmartAssistDashboardController {

    @AuraEnabled(cacheable=true)
    public static DashboardData getDashboardData(){

        DashboardData data = new DashboardData();

        data.totalCases =
            [SELECT Count() FROM Case];

        data.escalatedCases =
            [SELECT Count()
             FROM Case
             WHERE Status='Escalated'];

        data.highSeverityCases =
            [SELECT Count()
             FROM Case
             WHERE Severity__c='High'];

        data.criticalSeverityCases =
            [SELECT Count()
             FROM Case
             WHERE Severity__c='Critical'];

        data.totalAccounts =
            [SELECT Count()
             FROM Account];

        return data;
    }

    public class DashboardData{

        @AuraEnabled
        public Integer totalCases;

        @AuraEnabled
        public Integer escalatedCases;

        @AuraEnabled
        public Integer highSeverityCases;

        @AuraEnabled
        public Integer criticalSeverityCases;

        @AuraEnabled
        public Integer totalAccounts;
    }
}