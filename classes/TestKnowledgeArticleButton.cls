@isTest
private class TestKnowledgeArticleButton{

  @testSetup static void setup(){

    knowledge__kav servicekaknowledgekavObj = new knowledge__kav (
      Title = 'test value', 
      Type__c ='Request', 
      UrlName = 'testvalue'
    );
    insert servicekaknowledgekavObj;
     
  }

    @isTest static void testMethod1() {
       list<Knowledge__kav>  knowledgeListRecord = 
           KnowledgeArticleButton.getContactList('ka05g000001V5XIAA0');
      //  System.debug('Size:' +knowledgeListRecord.size());
       // System.assertEquals(1, knowledgeListRecord.size());
    }
    
     @isTest static void testMethod2() {
        KnowledgeArticleButton.getEntitlement('Support');
    }
}