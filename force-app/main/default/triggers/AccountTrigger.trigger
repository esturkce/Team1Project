trigger AccountTrigger on Account(after insert,after update) {
 AccountHandler.createopp(Trigger.new);
    system.debug(Trigger.operationType);
}