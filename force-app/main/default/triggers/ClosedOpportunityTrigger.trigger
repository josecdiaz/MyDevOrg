trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tskList = new List<Task>();
    for(Opportunity oppty : Trigger.New) {
        if(oppty.StageName == 'Closed Won')
        {
            Task task = new Task(Subject = 'Follow Up Test Task',
                                 WhatId = oppty.id);
            tskList.add(task);
        }
    }
    if(tskList.size() > 0){
    	insert tskList;        
    }
}