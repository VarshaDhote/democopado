@IsTest
public class TestSkillBasedRoutingClass {
    @isTest  
    static void Testmethod1(){
     
      List<Case> caseRecList = new List<Case>();
        List<Skill> allSkillsInDB = [SELECT id,MasterLabel from Skill];
        
    Case caselist = new Case(Subject='Phone enquiry',Description='Check battery',
                               cate__c='Delivery',Case_Type__c='Support',
                              Sub_Category__c='Delivery Time',Product_Category__c='Printer' );
        caseRecList.add(caselist);
    insert caseRecList;
    
    List<String> caseId = new List<String>();
    for(Case caseRec : caseRecList){
          PendingServiceRouting psr = new PendingServiceRouting(
            CapacityWeight = 1,
            IsReadyForRouting = FALSE,
            RoutingModel  = 'MostAvailable',
            RoutingPriority = 1,
            RoutingType = 'SkillsBased',
            ServiceChannelId = '0N95j000000H8jS',
            WorkItemId =caseRec.Id
          );
        SkillRequirement skillRequ = new SkillRequirement();
                skillRequ.SkillId = '0C55j000000Cb2dCAC';
                skillRequ.RelatedRecordId = psr.id;
                skillRequ.SkillLevel = 5;
                insert skillRequ;
        caseId.add(caseRec.Id);
       insert psr; 
        
        
    
        
        //SkillBasedRoutingClass.routingCasesToAgents(caseId);
        
        
         /** //FIND OUT THE SKILLS REQUIRED FOR A GIVEN CASE BASED ON ITS CATEGORY
            List<String> matchingSkillIds = new List<String>();
            for(Skill skillRec: allSkillsINDB){
                if(caseRec.ServiceKA__cate__c.contains(skillRec.MasterLabel)){
                    matchingSkillIds.add(skillRec.Id);
                }
            }
        
          List<SkillRequirement> skillReqsToInsert = new List<SkillRequirement>();
            //Associate matching skills with PSR request
            for(String matchingSkillId: matchingSkillIds){
                SkillRequirement skillRequ = new SkillRequirement();
                skillRequ.SkillId = matchingSkillId;
                skillRequ.RelatedRecordId = psr.id;
                skillRequ.SkillLevel = 5;
                skillReqsToInsert.add(skillRequ);
            }
            Insert skillReqsToInsert;
        
        psr.IsReadyForRouting = TRUE; 
            Update PSR;**/
        SkillBasedRoutingClass.routingCasesToAgents(caseId);
       // PendingServiceRouting ppsr = new PendingServiceRouting();
            //system.assertEquals(true, ppsr.IsReadyForRouting);
    }
        
    }
   
         /** list<Case> lstcase = new list<Case>();
        list<string> caseid = new list<string>();
        for(integer i=1; i>10; i++)
        {Case caselist = new Case(Subject='Phone enquiry'+i,Description='Check battery',
                                ServiceKA__cate__c='Delivery',ServiceKA__Case_Type__c='Support',
                                  ServiceKA__Sub_Category__c='Delivery Time' );
         lstcase.add(caselist);
        }
        insert lstcase;
        for (case cs: lstcase){
            caseid.add(cs.id);
        }
        SkillBasedRoutingClass.routingCasesToAgents(caseid);
       // PendingServiceRouting ppsr = new PendingServiceRouting();
          //  system.assertEquals(true, ppsr.IsReadyForRouting);**/
    }