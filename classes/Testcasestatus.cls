@isTest
public class Testcasestatus {
@testsetup 
    static void Creationtest(){
        Case caseobj = new Case(
            Subject = 'product issue',
            Origin = 'Bot',
            Status = 'New',
            Description = 'product issue description',
            MobileNumber__c = '8908908909' ,
            ContactId = '0035g00000fgIwcAAE'
        );
        insert caseobj;
    }
    static TestMethod void test_searchFAQ_UseCase1(){
    test.startTest();
     
         casestatus.CaseInput input = new casestatus.CaseInput();
    input.sCaseNumber = '00013304';
       
        
          List<casestatus.CaseInput> listInput = new List<casestatus.CaseInput>();
    listInput.add(input);

    casestatus.GetCaseStatus(listInput);

    test.stopTest();
        
    }
}