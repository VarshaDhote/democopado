public with sharing class TVKnowledgearticle {
 @AuraEnabled(cacheable=true)
    public static list<Knowledge__kav> getKnowledgeList() { 

         // create knowledge article list to store search result 
         list<Knowledge__kav> knowledgeListRecord = new list<Knowledge__kav>();
      //   list<knowledge__kav> knowledgeListRecord = new list<knowledge__kav>();

         for(Knowledge__kav knowObj : [SELECT Id,Title,Product_Category__c,Answer__c,ValidationStatus,
                 Service_Catalogue__r.Name From Knowledge__kav  WHERE Product_Category__c = 'Tv']){

            knowledgeListRecord.add(knowObj);
 
       } 

     return knowledgeListRecord;
 }
}