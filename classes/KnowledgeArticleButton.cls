public with sharing class KnowledgeArticleButton {
    @AuraEnabled(cacheable=true)

    public static list<Knowledge__kav> getContactList(string recordId) {

         // create contact list to store search result

         list<Knowledge__kav> knowledgeListRecord = new list<Knowledge__kav>();

      //   list<knowledge__kav> knowledgeListRecord = new list<knowledge__kav>();





         for(Knowledge__kav knowObj : [SELECT Id,Title,Product_Category__c From Knowledge__kav

                                   WHERE Id=:recordId]){



            knowledgeListRecord.add(knowObj);

 

       }
       return knowledgeListRecord;
}

// Milestone
@AuraEnabled(cacheable=true)
  public static list<Entitlement> getEntitlement(string name){
        
   string searchKeyword = '%' + name + '%';
 
   list<Entitlement> entitlementlist = new list<Entitlement>();
 System.debug('Entitlement Name :' +searchKeyword);

 for(Entitlement knowObj : [SELECT Id,Name From Entitlement  WHERE Name = :name ]){

                                    entitlementlist.add(knowObj);

       }
       return entitlementlist;
  }

}