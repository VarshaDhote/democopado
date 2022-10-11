public with sharing class CaseController {
//   @AuraEnabled  
//  public static string saveCase(Case contactRec, string file, string fileName) {  
//    string contactId;  
//    try{  
//      Insert contactRec;  
//     system.debug(contactRec);
//      contactId = contactRec.Id;  
//      String base64File = EncodingUtil.urlDecode(file, 'UTF-8');     
//      ContentVersion contentVersionRec = new ContentVersion();  
//      contentVersionRec.Title = fileName;  
//      contentVersionRec.PathOnClient = '/' + fileName;  
//      contentVersionRec.FirstPublishLocationId = contactRec.Id;  
//      contentVersionRec.VersionData = EncodingUtil.base64Decode(base64File);  
//      contentVersionRec.IsMajorVersion = true;  
//      Insert contentVersionRec;  
//    } catch(Exception ex){  
//      system.debug('Exception===>'+ex.getMessage());  
//    }  
//    return contactId;  
//  }    

 @AuraEnabled
   public static ContentVersion saveFile(Id idParent, String strFileName, String base64Data) {
       // Decoding base64Data
       base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
       
       // inserting file
       ContentVersion cv = new ContentVersion();
       cv.Title = strFileName;
       cv.PathOnClient = '/' + strFileName;
       cv.FirstPublishLocationId = idParent;
       cv.VersionData = EncodingUtil.base64Decode(base64Data);
       cv.IsMajorVersion = true;
       Insert cv;
       return cv;
   }

   


  }