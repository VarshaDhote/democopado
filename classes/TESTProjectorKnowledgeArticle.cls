@isTest
public class TESTProjectorKnowledgeArticle {
@testSetup static void setup(){
        knowledge__kav servicekaknowledgekavObj = new knowledge__kav (
      Title = 'test value', 
      Answer__c = 'Test Value',           
      UrlName = 'testvalue',
       Product_Category__c = 'Projector'     
    );
    insert servicekaknowledgekavObj;
    } 
      @isTest static void searchArticle(){
         list<Knowledge__kav> knowledgeListRecord = ProjectorKnowledgeArticle.getKnowledgeList();
    }
}