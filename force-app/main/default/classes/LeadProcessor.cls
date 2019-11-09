global class LeadProcessor implements Database.Batchable<sObject>{
    
    global Iterable<sObject> start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        return Database.getQueryLocator([Select id from Lead]);
    }
    global void execute(Database.BatchableContext bc, List<Lead> records){
        for(Lead lead: records){
            lead.LeadSource = 'Dreamforce';
        }
        update records;
    }    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    } 
}