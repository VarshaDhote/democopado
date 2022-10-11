@isTest
public class Testcasecreationforemail {
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
     
         casecreationforemail.CaseInput input = new casecreationforemail.CaseInput();
    input.cDescription = 'Test Description?';
        input.cSubject = 'Test subject?';
        input.cEmail = 'var@mail.com';
        input.cContact = '0035g00000fgIwcAAE';
        
          List<casecreationforemail.CaseInput> listInput = new List<casecreationforemail.CaseInput>();
    listInput.add(input);

    casecreationforemail.CaseCreation(listInput);

    test.stopTest();
        
    }
}