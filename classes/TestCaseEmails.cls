@isTest
private class TestCaseEmails{
        
  /*@testSetup static void setup(){

    Case  caseObj = new Case (
      Status ='New', 
      Subject = 'test value', 
      ServiceKA__Resolution_Comment__c = 'Test Value', 
      ServiceKA__Product_Category__c ='TV'
    );
    insert caseObj;
     Casecomment casecommentObj = new Casecomment (
      CommentBody = 'Test Value'
    );
    insert casecommentObj;
     
  }*/

  @isTest static void testMethod1() {
    CaseEmails.CaseEmailMessage('5005g00000UOnLGAA1');  
        CaseEmails.CaseDetails('5005g00000UOnLGAA1');
         CaseEmails.CaseComment('5005g00000UOnLGAA1');
       // caseupdate.caseclose('5005j00000RbzJgAAJ');
     //   List<Case> case1 = CaseContainer.getCaseDetails('5005g00000UOnLGAA1');
      //  system.assertEquals(1, case1.size());
        Productlist.ProductData('Lumber Group');
        Productlist.ContactData('Lumber Group');
        Productlist.getUserDetails('0055g00000EdE2nAAF');
        Productlist.getContactData('chatbot@yash.com');
        Productlist.getEntitlement('Case');
        
  }

  @isTest static void testMethod2() {
    // code_block  
  }
}