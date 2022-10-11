trigger CounterIncrement on Case (before insert, before update) {
    
    for(Case c : Trigger.new){ 
             
        
        if (c.Status =='More Information needed'){            
            c.Counter__c = c.Counter__c != null ? c.Counter__c +1: 1;
            system.debug('Check');
        }
        else if (c.Status =='In Progress'){
            c.CounterRequestor__c = c.CounterRequestor__c != null ? c.CounterRequestor__c +1: 1;
            system.debug('check progress');
        }
       
        
       
                    
    }
    
}