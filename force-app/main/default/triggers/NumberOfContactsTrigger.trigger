trigger NumberOfContactsTrigger on Contact (before insert,  before update, before delete, after insert, after update, after delete, after undelete) {
   
    if(Trigger.isBefore){
            System.debug('any before logic');
        if(Trigger.isInsert){
            System.debug('Before Insert Logic');
        }
        if(Trigger.isUpdate){
            System.debug('Before update logic');
        }
        if(Trigger.isDelete){
            System.debug('Before delete logic');
        }
    }
    
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            NumberOfContactsTriggerHandler.CalculateNumberOfActiveContacts(Trigger.new);
        }
        if(Trigger.isUpdate){
           NumberOfContactsTriggerHandler.CalculateNumberOfActiveContacts(Trigger.new);
        }
        if(Trigger.isDelete){
           NumberOfContactsTriggerHandler.CalculateNumberOfActiveContacts(Trigger.old);
        }
        if(Trigger.isUndelete){
            NumberOfContactsTriggerHandler.CalculateNumberOfActiveContacts(Trigger.new);
        }
    }
    
}