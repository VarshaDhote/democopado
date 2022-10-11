@isTest
private class TestSerachArticleDatatable {
    
    @testSetup static void setup(){
        knowledge__kav servicekaknowledgekavObj = new knowledge__kav (
      Title = 'test value', 
      Answer__c = 'Test Value',           
      UrlName = 'testvalue'
    );
    insert servicekaknowledgekavObj;
    } 
    
    
    @isTest static void searchArticle(){
         list<Knowledge__kav> knowledgeListRecord = SerachArticleDatatable.getKnowledgeList();
    }
}