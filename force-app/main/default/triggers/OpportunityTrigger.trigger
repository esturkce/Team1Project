trigger OpportunityTrigger on Opportunity (after insert, after update) {
		
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        OpportunityHandler.createTaskForClosedWonOpp(Trigger.new, Trigger.OldMap);
    }
}