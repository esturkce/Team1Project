public with sharing class SAManager1 {
    
    @AuraEnabled(cacheable=true scope='global')
    public static List<	SA_Detail_1__c> getAllSA(){

        return [SELECT Id, Experience__c, Customer_Handled__c, Date_of_Joining__c, Name__c FROM SA_Detail_1__c];
        
    }
	
	@AuraEnabled(cacheable=true scope='global')
    
        public static List<	SA_Detail_1__c> searchSas(){

            return getAllSA();
        }
    
}