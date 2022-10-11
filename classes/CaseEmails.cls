public with sharing class CaseEmails {
    
  @AuraEnabled(cacheable= true)
    public  static  List<Schema.EmailMessage>  CaseEmailMessage(string recordId) {
                   String Id = '5005j00000Of79UAAR';
            // fuller query
             List<Schema.EmailMessage> msg=  [Select ParentId,FromName,TextBody,CreatedDate From EmailMessage where ParentId=:recordId];  
            return msg;
    }

    @AuraEnabled(cacheable= true)
    public static List<Case> CaseDetails(string recordId){
      return [Select Id,CaseNumber,Owner.Name,Status,Case_Priority__c, Product_Category__c,Resolution_Comment__c,Subject FROM Case  where Id=:recordId];
    }

    @AuraEnabled(cacheable= true)
    public  static  List<CaseComment>  CaseComment(string recordId) {
                  string casecreatedDate,CommentBody,Name,ParentId,CaseId;
                   List<String> casecmmt = new List<String>();
            // fuller query
             List<CaseComment> msg=  [SELECT Id,ParentId,CreatedBy.Name,CommentBody,CreatedDate FROM CaseComment where ParentId=:recordId order by CreatedDate asc];    
            return msg ;
    }

  }