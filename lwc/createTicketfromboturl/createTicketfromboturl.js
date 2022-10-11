import { LightningElement ,track,api, wire} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';  
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; 
const MAX_FILE_SIZE = 100000000; //10mb
import entitlement from '@salesforce/apex/Productlist.getEntitlement';
import saveFile from '@salesforce/apex/CaseController.saveFile';
import KnowledgeArticleButton from '@salesforce/apex/KnowledgeArticleButton.getContactList';


export default class CreateTicketfromboturl extends NavigationMixin(LightningElement) {
    @api accountId;
    @api ProductName;  
  @track filesize = 0;
  @track recordData;
  @api recordId;
  @track recordType;
  @track entitlementId;
  @track ProductCategory;



  @track customFormModal = false; 
  uploadedFiles = []; file; fileContents; fileReader; content; fileName  

 
  customShowModalPopup() {            
    this.customFormModal = true;
}

customHideModalPopup() {    
    console.log("insighthidemodalpopup")
    this.customFormModal = false;
}



@wire(entitlement, {name:'Case'})
wiredEntilementdata({data, error}){
  if(data){
      this.recordData = data;
      this.error = undefined;
      console.log("callll"+ JSON.stringify(data));
      
           data.forEach(record => {
                 //  console.log("record: " +record.Title);
                 //  this.recordType = record.ServiceKA__Type__c;
                  // console.log("record Type: " +this.recordType);  
                  // this.entilementdata(this.recordType); 
                  console.log("name :" +record.Name);   
                  this.entitlementId = record.Id;   
                  console.log("Id :" +this.entitlementId);      
     
                  KnowledgeArticleButton({
                    recordId:'$recordId'
                })
                     .then(result => {
                         this.result =result;
                         this.error = undefined;
                         window.console.log("Data :" +JSON.stringify(result));
                
                
                         result.forEach(record =>{
                          console.log("record: " +record.Title);
                          this.recordType = record.Product_Category__c;
                          console.log("record Type: " +this.recordType); 
                         })
                     })
                     .catch(error => {
                         // TODO Error handling
                         this.error = error;
                         this.result = undefined;
                         window.console.log("error :" +JSON.stringify(error));
                     });
     
                });
    }
  else if (error) {
    this.error = error;
    this.resultData = undefined;
    window.console.log("error :" +JSON.stringify(error));
  }
}


// @wire(KnowledgeArticleButton, {recordId:'$recordId'})
// wiredContacts({data, error}){
//     if(data){
//         this.recordData = data;
//         this.error = undefined;
//         console.log("callll"+ JSON.stringify(data));
        
//              data.forEach(record => {
//                      console.log("record: " +record.Title);
//                      this.recordType = record.ServiceKA__Product_Category__c;
//                      console.log("record Type: " +this.recordType); 
//                   //   this.entilementdata('casemate process');
//                   this.ProductCategory = record.ServiceKA__Product_Category__c;
//                   console.log("Productcategory: " +this.ProductCategory);
                                       
//              });
//       }
//     else if (error) {
//         this.error = error;
//         this.recordData = undefined;
//     }
//   }

  @wire(KnowledgeArticleButton, {recordId:'$recordId'})

wiredContacts({data, error}){

    if(data){

        this.recordData = data;

        this.error = undefined;

        console.log("callll"+ JSON.stringify(data));

       

             data.forEach(record => {

                     console.log("record: " +record.Title);

                     this.recordType = record.Product_Category__c;

                     console.log("record Type: " +this.recordType);  

                     this.entilementdata();            

             });

      }

    else if (error) {

        this.error = error;

        this.recordData = undefined;

    }

}


entilementdata(){
  entitlement({
    name: 'Case'
})
     .then(result => {
         this.result =result;
         this.error = undefined;
         window.console.log("Data :" +JSON.stringify(result));


         result.forEach(record =>{
           console.log("name :" +record.Name);
            this.entitlementId = record.Id;
           console.log("Id :" +this.entitlementId);
         })
     })
     .catch(error => {
         // TODO Error handling
         this.error = error;
         this.result = undefined;
         window.console.log("error :" +JSON.stringify(error));
     });
  

}

 

showSuccessToast() {

const evt = new ShowToastEvent({

    title: 'Ticket Created Successfully',

    message: 'Your ticket is created successfully',

    variant: 'success',

    mode: 'dismissable'

});

this.dispatchEvent(evt);

}




handleSuccess(event) {
  this.fileUploadId = event.detail.id;
  if (this.fileUploadId && this.fileName != '') {
      this.uploadHelper();
  }
  const toastEvent = new ShowToastEvent({
    title:'Success',
    message:'Case created successfully',
    variant:'success',

})
 
this.dispatchEvent(toastEvent);
this.customHideModalPopup();

console.log(event.detail.id);

this[NavigationMixin.Navigate]({
  type: 'standard__recordPage',
  attributes: {
      recordId: event.detail.id,
      objectApiName: 'Case',
      actionName: 'view'
  },
});
}


 

  uploadFiledAction(event) {

    // Get the list of uploaded files

    const uploadedFiles = event.detail.files;
    console.log("uploaded file:" +JSON.stringify(uploadedFiles));

   // alert("No. of files uploaded : " + uploadedFiles.length);

    const toastEvent = new ShowToastEvent({

        title:'Files uploaded successfully',

        message:'No. of files uploaded ' + uploadedFiles.length,

        variant:'success',

    })

    this.dispatchEvent(toastEvent);

}


  onFileUpload(event) {  
    console.log("length: " +event.target.files.length);
      if (event.target.files.length > 0) {  
        this.uploadedFiles = event.target.files;  
        this.fileName = event.target.files[0].name;  
        console.log("file name:" +this.fileName);
        this.file = this.uploadedFiles[0];  
        this.uploadFiledAction(event);
        if (this.file.size > this.MAX_FILE_SIZE) {  
          alert("File Size Can not exceed" + MAX_FILE_SIZE);  
        }  
      }  
  }  









   
    ///////////////////////////////////////////////////////////////

    saveClick(event) {
      console.log("submit"+event.detail.id);
      this.template.querySelector('lightning-record-edit-form').submit(this.fields);
     
    }

    uploadHelper() {
      console.log('enter in uploadHelper')
      // create a FileReader object 
      this.fileReader = new FileReader();
      // set onload function of FileReader object  
      this.fileReader.onloadend = (() => {
          this.fileContents = this.fileReader.result;
          let base64 = 'base64,';
          this.content = this.fileContents.indexOf(base64) + base64.length;
          this.fileContents = this.fileContents.substring(this.content);

          // call the uploadProcess method 
          this.saveToFile();
      });

      this.fileReader.readAsDataURL(this.file);
  }

  // Calling apex class to insert the file
  saveToFile() {
    console.log('enter in saveToFile')
      saveFile({ idParent: this.fileUploadId, strFileName: this.file.name, base64Data: encodeURIComponent(this.fileContents) })
          .then(result => {
          })
          .catch(error => {

          });
  }

}