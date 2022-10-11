trigger CloseMilestone on Case (after insert,after update) {
    System.debug('test');
    for(Case c : Trigger.new){ 
        List<Case> caslist = new List<Case>();
        // ===== milestone
        if(c.Notified_Customer__c == true && c.Status == 'New' ){
        List<CaseMilestone> smUpdate = [select Id,StartDate,completionDate from CaseMilestone
                     where caseId = :c.Id];

                System.debug('milestone:' +smUpdate);
                
                 for (CaseMilestone cm : smUpdate){
                            
                            //cm.completionDate = c.ServiceKA__MilestoneCompletionTime__c;
                          cm.completionDate = System.now();
                     System.debug('date:' +cm.completionDate);
                             
                            }
                        update smUpdate;
                                    
                System.debug('milestone:' +smUpdate);
                     
        }
   /*
        if(c.ServiceKA__Notify_User__c == true){
              List<CaseMilestone> smUpdate = [select Id,StartDate,completionDate from CaseMilestone
                     where caseId = :c.Id];

            
            System.debug('milestone:' +smUpdate);
                
                 for (CaseMilestone cm : smUpdate){
                            
                            //cm.completionDate = c.ServiceKA__MilestoneCompletionTime__c;
                          cm.completionDate = System.now();
                     System.debug('date:' +cm.completionDate);
                             
                            }
                        update smUpdate;
                                    
                System.debug('milestone:' +smUpdate);
        }
     */   
      System.debug('test2');   
    }
    
   if(trigger.isAfter && trigger.isUpdate){
    if (UserInfo.getUserType() == 'Standard'){
        DateTime completionDate = System.now(); 
            List<Id> updateCases = new List<Id>();
            for (Case c : Trigger.new){
                    if (((c.isClosed == true)||(c.Status == 'Closed'))&&((c.SlaStartDate 
                        <= completionDate)&&(c.SlaExitDate == null)))
        updateCases.add(c.Id);
        }
    if (updateCases.isEmpty() == false)
        system.debug('completion' + completionDate);
        milestoneUtils.completeMilestone(updateCases, 'Case Accepting Milestone', completionDate);
      //  milestoneUtils.completeMilestone(updateCases, 'milestone 1', completionDate);
    }
        
  }
        
        
    
}