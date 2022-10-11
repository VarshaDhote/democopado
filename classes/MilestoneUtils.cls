public class MilestoneUtils {
    public static void completeMilestone(List<Id> caseIds, String milestoneName, DateTime complDate) { 
        
        System.debug('calling MilestoneUtils with these inputs: MilestoneName='
                                 +milestoneName+' completeDate='+complDate);
        System.debug('Case list with milestones to complete: '+JSON.serializePretty(caseIds));
        
        List<CaseMilestone> cmsToUpdate = [select Id, completionDate
                from CaseMilestone cm
                where caseId in :caseIds and cm.MilestoneType.Name=:milestoneName 
                and completionDate = null limit 1];
            for (CaseMilestone cm : cmsToUpdate){
                cm.completionDate = complDate;
            }
            update cmsToUpdate;
        }
   
}