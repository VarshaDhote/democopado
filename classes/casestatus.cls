public class casestatus {
  public class CaseOutput {
    @InvocableVariable(required=true)
    public String sStatus;
  }

  public class CaseInput {
    @InvocableVariable(required=true)
    public String sCaseNumber;
  }
    
  @InvocableMethod(label='Get Case Status')
    public static List<CaseOutput> GetCaseStatus( List <CaseInput> caseInputs ) {
        Set<String> caseNumber = new Set<String>(); 

    // Get the order numbers from the input
    for (CaseInput caseInput : caseInputs) {
      caseNumber.add(caseInput.sCaseNumber);
    }

    // Get the order objects from the set of order numbers
    List<Case> caseObj = 
      [SELECT CaseNumber,Status FROM Case where CaseNumber in :caseNumber];
    
    // Create a map of order numbers and order status values
    Map<String, String> mapNameStatus = new Map<String, String>(); 
    if (caseObj.size() > 0) {
        for (Case case1 : caseObj) {
          mapNameStatus.put(case1.CaseNumber, case1.Status);
        }
    }
    
    // Build a list of order status values for the output
    List<CaseOutput> caseOutputs = new List<CaseOutput>();
    for (CaseInput caseInput : caseInputs) {
      CaseOutput caseOutput = new CaseOutput();
      
      // Do we have a status for this order number?
      if (mapNameStatus.containsKey(caseInput.sCaseNumber)) {
          // If so, then add the status
          caseOutput.sStatus = mapNameStatus.get(caseInput.sCaseNumber);
      } else {
          // If not, then add an unknown status value
          caseOutput.sStatus = 'Case not found';
      }
      caseOutputs.add(caseOutput);
    }
    
    return caseOutputs;    
  }
}