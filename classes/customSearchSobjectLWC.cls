public with sharing class customSearchSobjectLWC {
  
  
   @AuraEnabled(cacheable=true)
    public static User getUserDetails(Id recId) {
    try{
    user userrec;
    if(recId != null || recId != '')
    { 
    userrec =  [Select Id , FirstName ,Profile.Name from User where Id =:recId];
    }
    return userrec;
    } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
	
  
  
  
  
   @AuraEnabled(cacheable=true)
    public static list<Knowledge__kav> getContactList(string searchKey) {
      
        string searchKeyword = '%' + searchKey + '%';

         // create contact list to store search result 
         list<Knowledge__kav> knowledgeListRecord = new list<Knowledge__kav>();
      //   list<knowledge__kav> knowledgeListRecord = new list<knowledge__kav>();



         for(Knowledge__kav knowObj : [SELECT Id,Title,Answer__c,ArticleNumber From Knowledge__kav
                                   WHERE Title LIKE : searchKeyword]){

            knowledgeListRecord.add(knowObj);
 
       } 

    /*
         // query contact records
        for(ServiceKA__Knowledge__kav conObj : [SELECT Id,Title,ServiceKA__Answer__c From ServiceKA__Knowledge__kav
                               WHERE name LIKE : searchKeyword]){
                   
                 contactListRecord.add(conObj);
               
        
    } 
    if(contactListRecord.size() == 0){
        throw new AuraHandledException('No Record Found..'); 
     }
     
        */

     return knowledgeListRecord;
}

}