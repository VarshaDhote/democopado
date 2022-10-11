trigger EntitlementTrigger on Case (after insert) {
     
    if(trigger.isInsert){
     for(Case c : Trigger.new){ 
         System.debug('test'); 
     //   Case c  = [SELECT Id,EntitlementId,Origin FROM Case WHERE Id = :agwork.WorkItemId];
       List<AgentWork> agwork =  [SELECT Id ,AcceptDateTime,WorkItemId,AssignedDateTime FROM AgentWork where WorkItemId = :c.Id];
         System.debug('agent :' +agwork);
    
     }
    }
     
    
    }