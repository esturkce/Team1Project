public with sharing class SAManager1 {
    
    @AuraEnabled(cacheable=true scope='global')
    public static List<	SA_Detail_1__c> getAllSA(){

        return [SELECT Id, Name, Experience__c, Customer_Handled__c, Date_of_Joining__c, Name__c FROM SA_Detail_1__c];
        
    }
}