@isTest
private class TestCaseController {
    
    @isTest  static void TestMethod1(){
        List<Case> caseRecList = new List<Case>();
        
        Case caselist = new Case(Subject='Phone enquiry',Description='Check battery',
                                cate__c='Delivery',Case_Type__c='Support',
                              Sub_Category__c='Delivery Time' );
        caseRecList.add(caselist);
        
       insert caseRecList;  
        
        for(case c : caseRecList){
             CaseController.saveFile(c.id,'File Test ','base64Data') ;
        }
       // ContentVersion saveFile(Id idParent, String strFileName, String base64Data) {
    }
}