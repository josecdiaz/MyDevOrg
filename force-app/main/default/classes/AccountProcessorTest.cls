@IsTest
public class AccountProcessorTest {
    public static Account accountRecord;
     
    public static void testSetup(){
        Account accountTest = new Account(Name='Test Account 1');
        insert accountTest;
        accountRecord = accountTest;
        
        Contact contact1 = new Contact(LastName='Contact1', AccountId=accountRecord.Id);
        Contact contact2 = new Contact(LastName='Contact1', AccountId=accountRecord.Id);
        insert contact1;
        insert contact2;
    }
    
    @IsTest
    public static void testCount(){
        Test.startTest();
        testSetup ();
        List<Id> idLst = new List<Id>();
        idLst.add(accountRecord.Id);
        AccountProcessor.countContacts(idLst);
        Test.stopTest();
        System.assert([SELECT Number_of_Contacts__c FROM Account WHERE Id = :accountRecord.Id].Number_of_Contacts__c == 2, 'Error in processing number of contacts');
    }
}