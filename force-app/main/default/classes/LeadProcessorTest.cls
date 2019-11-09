@IsTest
public class LeadProcessorTest {
	public static List<Lead> leadRecords = new List<Lead>();
    
    @testSetup
	public static void testSetup(){
        for(integer i = 0; i < 200; i++){
            Lead leadRecord = new Lead(LastName='LastName: '+i,Company='Company: '+i);
            leadRecords.add(leadRecord);
        }
        insert leadRecords;
    }
    
    @IsTest
    public static void testCount(){
        Test.startTest();
        LeadProcessor leadProcessorBatch = new LeadProcessor();
        Id batchId = Database.executeBatch(leadProcessorBatch);
        Test.stopTest();
        for(Lead leadRecord : [SELECT LeadSource FROM Lead]){
            System.assertEquals(leadRecord.LeadSource, 'Dreamforce', 'ERROR: LeadSource is not Dreamforce');
        }
    }
}