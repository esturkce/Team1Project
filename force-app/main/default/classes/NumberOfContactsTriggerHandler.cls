public with sharing class NumberOfContactsTriggerHandler {
    
    public static void CalculateNumberOfActiveContacts(List<Contact> contactList){
        
        Set<Id> accountIds = new Set<Id>();
        for (Contact cnt : contactList){
            if (String.isNotBlank(cnt.AccountId)){
                accountIds.add(cnt.AccountId);
            }
        }
        
        List<Account> accntList = [SELECT Id, Active_Contacts__c, 
                                  (SELECT Id From Contacts WHERE Active__c = true)
                                  FROM Account Where Id IN:accountIds];
        
        for(Account accnt:accntList){
            if(!accnt.Contacts.isEmpty()){
                accnt.Active_Contacts__c = accnt.Contacts.size();
            }
            
        else{
               accnt.Active_Contacts__c = 0;
            }
        }
        update accntList;
    }

}