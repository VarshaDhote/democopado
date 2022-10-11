public without sharing class Productlist {
   
    @AuraEnabled(cacheable = true)
    public  static List<Product_list__c> ProductData(string accName) {
        
        System.debug('Name Account'+accName);

        // List<ServiceKA__Product_list__c> Productlist = [SELECT id,ServiceKA__Account__r.Name,ServiceKA__Product__r.ServiceKA__Product_Category__c ,
        //         ServiceKA__Product__r.ServiceKA__Brand__c,ServiceKA__Product__r.Name
        //     from ServiceKA__Product_list__c where ServiceKA__Account__r.Name = :accName ];


            List<Product_list__c> Productlist1= [ SELECT Id,Contact__r.Id,Contact__r.Name,Contact__r.Account.Subscription_duration__c ,Contact__r.Subscription__c,Contact__r.Phone,Contact__r.Email,Contact__r.AccountId,Contact__r.Account.Name , Product__r.Product_Category__c,Product__r.Brand__c,Product__r.Name FROM Product_list__c
                  where Contact__r.Account.Name = :accName ];

        System.debug('Product list'+Productlist1);

        return  Productlist1;
        
    }

    @AuraEnabled(cacheable = true)
    public  static List<Contact> ContactData(String accName) {
        return [SELECT Id,Name,Account.Subscription__c,Account.Name, Account.Subscription_duration__c,Phone,Email FROM Contact where Account.Name=:accName ];

    }

    @AuraEnabled(cacheable=true)
    public static User getUserDetails(Id recId) {
    try{
    user userrec;
    if(recId != null || recId != '')
    { 
    userrec =  [SELECT Id,Name,AccountId,ContactId,Email,Username,ProfileId,Profile.Name
                  ,Account.Name FROM User where Id =:recId];
    }
    return userrec;
    } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

	
      @AuraEnabled(cacheable = true)
       public static  List<Contact> getContactData(String UserName){
           Return [SELECT Id,Name,Account.Name FROM Contact WHERE Name = :UserName];

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