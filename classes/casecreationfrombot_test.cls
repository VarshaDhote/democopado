@istest
public class casecreationfrombot_test {
 @istest static void Creationtest(){
        Case caseobj = new Case();
     
           caseobj.Subject = 'product issue';
            caseobj.Origin = 'Bot';
            caseobj.Status = 'New';
            caseobj.Description = 'product issue description';
            caseobj.MobileNumber__c = '8908908909' ;
            caseobj.ContactId = '0035g00000fgIwcAAE';
   insert caseobj;
     Test.startTest();
    List<Case> m =[select id from Case where Id=: caseobj.id];
    
     System.assertEquals(1,m.size());
      Test.stopTest();
}
    
}