public class OpportunityHandler {

    public static void createTaskForClosedWonOpp(List<Opportunity> oppList, Map<Id,Opportunity> oppOldMap){
        	//Birden fazla task olusturmamiz gerekebileceginden ici bos bir task listesi olusturacagiz.
        	//Olusturulan butun taskleri bu listenin icine aktarip, listeyi insert etmemiz gerekecek.
        List<Task> taskList = new List<Task>();
        //Trigger icin gerekli opp listesini teker teker for loop ile kontrol edecegiz.
        	//Eger stageName i closewon ise update etmeye gerek olmayacagi icin stagename in
        	//eski degeri ile yeni degerini karsilastiriyoruz
        	//eger stagename de degisiklik varsa task i create etmemiz gerekecek.
        //opp bilgisi ile olusturulan taskleri requirement lar dogrultusunda yazip yukarida olusturdugumuz
        //taskList icerisine ekleyecegiz. 
        for(Opportunity opp : oppList)	{
            if (opp.StageName == 'Closed Won' && opp.StageName != oppOldMap.get(opp.Id).stageName){
                Task oppTask = new Task();
                	oppTask.Subject = 'Follow Up Task';
                	oppTask.WhatId = opp.Id;
                	oppTask.OwnerId = opp.OwnerId;
                	oppTask.ActivityDate = opp.CloseDate.addMonths(1);
                taskList.add(oppTask);
                        
            }
                
        }
        //If statement yazmadan direkt olarak da insert edebiliriz ama hata ile karsilasmamak adina eklenebilir.
        if(!taskList.isEmpty()){
            insert taskList;
        }
        
    }
}