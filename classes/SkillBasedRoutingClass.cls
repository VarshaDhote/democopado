public class SkillBasedRoutingClass {
    @InvocableMethod
    public static void routingCasesToAgents(List<String> caseIds){
        //Create PSR 
        //Add skills to the request for the case
        //Push it to queue
        List<Case> casesInserted = [SELECT id,Product_Category__c from Case where ID IN: caseIds];
        ServiceChannel sc = [SELECT Id
                FROM ServiceChannel WHERE DeveloperName = 'new'
                LIMIT 1];
        LIst<Skill> allSkillsInDB = [SELECT id,MasterLabel from Skill];
        
        for(Case caseRec : casesInserted){
            PendingServiceRouting psr= new PendingServiceRouting();
            psr.workItemId = caseRec.Id ;
            psr.RoutingType = 'SkillsBased';
            psr.RoutingPriority = 1;
            psr.CapacityWeight = 1;
            psr.ServiceChannelId = sc.Id; // SERVICE CHANNEL ID 0N95g000000xGtO
            psr.RoutingModel = 'MostAvailable';
            psr.IsReadyForRouting = FALSE; //DRAFT state
            system.debug('PSR : ' + psr);
            Insert psr; //DONE WITH FIRST STEP
            
            //FIND OUT THE SKILLS REQUIRED FOR A GIVEN CASE BASED ON ITS CATEGORY
            List<String> matchingSkillIds = new List<String>();
            for(Skill skillRec: allSkillsINDB){
                if(caseRec.Product_Category__c.contains(skillRec.MasterLabel)){
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
           
            //PUSH our request in to the queue
            psr.IsReadyForRouting = TRUE; 
            Update PSR;
        }
    }
}