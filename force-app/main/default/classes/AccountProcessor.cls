global class AccountProcessor {
    @future
    public static void countContacts (List<Id> ids){
        for(Id accountId : ids){
            System.debug('Number_of_Contacts__c: '+[Select count() FROM Contact WHERE AccountId = :accountId]);
            Account account = new Account(
            Id = accountId, 
            Number_of_Contacts__c =[Select count() FROM Contact WHERE AccountId = :accountId]);
            upsert account;
        	System.debug('Inside countContacts(): '+JSON.serializePretty(account));
        }
    }
}