@isTest
public class Testcasecreationfrombot {
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
     
         casecreationfrombot.CaseInput1 input = new casecreationfrombot.CaseInput1();
    input.cDescription = 'Test Description?';
        input.cSubject = 'Test subject?';
        input.cPhone = '8909878909';
        input.cContact = '0035g00000fgIwcAAE';
        
          List<casecreationfrombot.CaseInput1> listInput = new List<casecreationfrombot.CaseInput1>();
    listInput.add(input);

    casecreationfrombot.CaseCreation(listInput);

    test.stopTest();
        
    }
}