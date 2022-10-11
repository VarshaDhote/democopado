public with Sharing class casecreationfrombot {
         public class CaseInput1 {
        @InvocableVariable(required=true)
        public String cDescription;
        
        @InvocableVariable(required=true)
        public String cSubject;
     
         @InvocableVariable(required=true)
        public String cPhone;

          @InvocableVariable(required=true)
        public String cContact;          
             
    }
    
    public class CaseOutput1 {
        @InvocableVariable(required=true)
        public String cCaseNumber;
        
        @InvocableVariable(required=true)
        public String cCaseId;
        
        @InvocableVariable(required=true)
        public sObject Case_List;
        
    }
    
    @InvocableMethod(label='Case Creation') 
    public static List<CaseOutput1> CaseCreation( List <CaseInput1> caseinputs ) { 
        Case ca = new Case();
        List<Case> newCase = new List <Case>();
        for(CaseInput1 ci:caseinputs){
            
            ca.Subject = ci.cSubject;
            ca.Origin = 'Bot';
            ca.Status = 'New';
            ca.Description = ci.cDescription;
            ca.MobileNumber__c = ci.cPhone;
            ca.ContactId = ci.cContact;
            
            
            newCase.add(ca);
            //SendEmail.sendEmail(senderEmails);
        }
        insert newCase;
        
        system.debug('New Case Created--->'+newCase);
        system.debug('New Case Number--->'+ca.CaseNumber);
        system.debug('New Case ID--->'+ca.ID);
        system.debug('ContactID--->'+ca.ContactId);
        
        List<CaseOutput1> objOutputs = new List <CaseOutput1>();
        CaseOutput1 objOutput = new CaseOutput1();
        objOutput.Case_List = ca;
        //   List<Contact> conList = [select Id,Email from Contact where Id=:objOutput.ContactId];
        for (Case objCase : [ SELECT id, Status, CaseNumber FROM Case WHERE ID =: ca.ID ] ){
            system.debug('Case Number--->'+objCase.CaseNumber);
            objOutput.cCaseNumber = objOutput.cCaseNumber == null ? objCase.CaseNumber : ( objOutput.cCaseNumber + ', ' + objCase.CaseNumber ) ;
                objOutput.cCaseId = objOutput.cCaseId == null ? objCase.ID : ( objOutput.cCaseId + ', ' + objCase.ID ) ; 
                    }
        system.debug('objOutput--->'+objOutput.cCaseNumber);
        objOutputs.add(objOutput); 
        return objOutputs;
    }
}