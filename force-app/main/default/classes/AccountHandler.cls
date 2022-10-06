public class AccountHandler {
 public static void createopp ( List<Account> newList){
    List <Opportunity> oppList = new List <Opportunity>(); 
    List<Account> accList = [Select ID,Name From Account WHERE ID IN :newList AND ID NOT IN (SELECT AccountID from Opportunity)]; 
    // 
    for (Account acc:accList){ 				 
        oppList.add(new Opportunity(Name=Acc.name + ' ' + 'TTC Opportunity record', 
                                    StageName='Prospecting',
                                    AccountID=Acc.Id,
                                    CloseDate=system.today().AddMonths(1)
                                   )
                   );
    }
    if (oppList.size()!=0){ 
        database.upsert(oppList,false);
    }
    
}
}