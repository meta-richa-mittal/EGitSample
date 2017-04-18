trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasksToAdd = new List<Task>();
    
    for(Opportunity opp: [SELECT Id, StageName FROM Opportunity WHERE StageName = 'Closed Won']) {
        tasksToAdd.add(new task(Subject='Follow Up Test Task', WhatId=opp.Id));
    }
    
    insert tasksToAdd;
}