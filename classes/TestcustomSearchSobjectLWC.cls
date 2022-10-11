@isTest
private class TestcustomSearchSobjectLWC{

  @testSetup static void setup(){

    knowledge__kav servicekaknowledgekavObj = new knowledge__kav (
      Title = 'test value', 
      Answer__c = 'Test Value',
      UrlName = 'testvalue'
    );
        insert servicekaknowledgekavObj;
    }

  @isTest static void testMethod1() {
    // code_block  
    User user = customSearchSobjectLWC.getUserDetails('0055j000002kSQ5'); 
      
  }

  @isTest static void testMethod2() {
    // code_block  
      list<Knowledge__kav>   knowledgearticle =  customSearchSobjectLWC.getContactList('shipping');
        System.debug('test'+knowledgearticle);
    }
}