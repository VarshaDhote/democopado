@isTest
public class TestPrinterKnowledgearticle {
@testSetup static void setup(){
        knowledge__kav servicekaknowledgekavObj = new knowledge__kav (
      Title = 'test value', 
      Answer__c = 'Test Value',           
      UrlName = 'testvalue',
       Product_Category__c = 'Printer'     
    );
    insert servicekaknowledgekavObj;
    } 
      @isTest static void searchArticle(){
         list<Knowledge__kav> knowledgeListRecord = PrinterKnowledgearticle.getKnowledgeList();
    }
}