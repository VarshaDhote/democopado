import { LightningElement,wire,track,api } from 'lwc';
import ProductData from '@salesforce/apex/Productlist.ProductData';
import { getRecord } from 'lightning/uiRecordApi';
import USER_ID from '@salesforce/user/Id'; //this is how you will retreive the USER ID of current in user.
import NAME_FIELD from '@salesforce/schema/User.AccountId';
import ACCOUNTNAME_FIELD from '@salesforce/schema/User.Account.Name';
import ACCOUNT_FIELD from '@salesforce/schema/User.Name';
//import getaccList from '@salesforce/apex/subscriptonapex.getaccList';
//import getconList from '@salesforce/apex/subscriptonapex.getconList';
import getContactData from '@salesforce/apex/Productlist.getContactData';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; 
const MAX_FILE_SIZE = 100000000; //10mb
import entitlement from '@salesforce/apex/Productlist.getEntitlement';
import KnowledgeArticleButton from '@salesforce/apex/KnowledgeArticleButton.getContactList';
import saveFile from '@salesforce/apex/CaseController.saveFile';
import { refreshApex } from '@salesforce/apex';

const columns = [
    { label: ' Product Name ', 
    fieldName: "Product__c" ,  
    type: "text",
    // typeAttributes: { label: { fieldName: "ServiceKA__Product__c"}, name: "gotoOpportunity", variant: "base" },
    target : 'self',
    sortable: true},
   
    {label: 'Contact Name', 
    fieldName: 'Name', 
    type: 'text',
    sortable: true}, 

    {label: 'Account Name', 
    fieldName: 'Account__c', 
    type: 'text',
    sortable: true}, 
   
    { label: 'Purchase Category',
     fieldName: "ProductCategory",
     type: 'text',
     sortable: true}, 

    { label: 'Purchase SubCategory ',
     fieldName: "ProductSubCategory",
    type: 'text',
    sortable: true},

    { label: 'Contact No ',
     fieldName: "Phone",
    type: 'text',
    sortable: true},

    { label: 'Email Id ',
     fieldName: "Email",
    type: 'email',
    sortable: true},
    // { label: 'Product Id', fieldName: "product" ,type:'text',sortable: true},
    {
       // type: 'action',
        //typeAttributes: { rowActions: actions },
    },
];

const subcolumns = [{
    
    label: 'Subscription Name',
    fieldName: 'Subscription',
    type: "text",
    // typeAttributes: { label: { fieldName: "Subscription" }, name: "gotoOpportunity", variant: "base" },
    target : 'self',
    sortable: true
},
{
   
    label: 'Subscription Duration',
    fieldName: 'Subscriptionduration',
    type: 'text',
    sortable: true 
},
{
    label: 'Account Name',
    fieldName: 'Account__c',
    type: 'text',
    sortable: true 
},
{label: 'Contact Name', 
    fieldName: 'Name', 
    type: 'text',
    sortable: true
}, 

{ label: 'Contact No ',
fieldName: "Phone",
type: 'text',
sortable: true},

{ label: 'Email Id ',
fieldName: "Email",
type: 'email',
sortable: true}

];

export default class Assetspage  extends NavigationMixin(LightningElement){
   @track column = columns; @track subcolumns = subcolumns;
   @track data ;log;ProductData;UserName; condata = [];Name;AccountName;Productlist;
 //  @track subcolumns = columnssub;

 @api producthide=false;showform =false;
@api name; accList ;conList ; Productlist;product;ContactId;
@api productCategory;Contactname;Accountname;Brand;ContactNo;email;Subject;Description;
    //  @wire(getconList)
    //  wiredAccounts({
    //   error,
    //     data
    //  }) {
    //      if (data) {
    //          this.conList = data;
    //          console.log(this.conList);

    //      } else if (error) {
    //          this.error = error;
    //         console.log(this.error);
    //      }
    //  }

   

  
   @wire(getRecord, {
       recordId: USER_ID,
       fields: [ACCOUNT_FIELD, NAME_FIELD]
   }) wireuser({
       error,
       data
   }) {
       if (error) {
          this.error = error ; 
       } else if (data) {
           this.UserName = data.fields.Name.value;
           console.log( 'Test Name'+this.UserName);
           //this.getContact(this.UserName);
           getContactData({

        UserName: this.UserName
        
        })
        
             .then(result => {
        
                 this.result =result;
        
                 this.error = undefined;
        
                 window.console.log("Data :" +JSON.stringify(result));
                        this.condata = JSON.stringify(result);
                result.forEach(record=>{
                    console.log('Test result:'+JSON.stringify(record.Account.Name));
                    this.Name = JSON.stringify(record.Account.Name);
                  //  this.Productlist(JSON.stringify(record.Account.Name));
                  const text = this.Name.length;
                  console.log('text '+text);
                  this.AccountName = this.Name.substring(1, text-1);
                  console.log('Res  '+this.AccountName);
                     
                })
                
                ProductData({
                    accName: this.AccountName
                })
                .then(result =>{
                    console.log(" Accounts data: " +JSON.stringify(result));

                    let preparedArr = [];
                                result.forEach(record =>{
                                    let preparedRec = {};
                                    console.log('record acc:'+JSON.stringify(result));
                                  
                                    preparedRec.Account__c = record.Contact__r.Account.Name;
                                 //   preparedRec.Title = record.Title;
                                    preparedRec.Product__c = record.Product__r.Name;
                                       preparedRec.ProductCategory = record.Product__r.Product_Category__c,
                                      preparedRec.ProductSubCategory   = record.Product__r.Brand__c,
                                     preparedRec.Email = record.Contact__r.Email;
                                      preparedRec.Phone = record.Contact__r.Phone;
                                      preparedRec.Name = record.Contact__r.Name;
                                      preparedRec.ContactId = record.Contact__r.Id;
                                      preparedRec.Subscriptionduration = record.Contact__r.Account.Subscription_duration__c ;
                                     preparedRec.Subscription = record.Contact__r.Subscription__c;
                                     // preparedRec.Id = record.Id;
                                   // preparedRec.ValidationStatus = record.ValidationStatus;
                                      preparedRec.product = record.Product__r.Id;
                        
                                    preparedArr.push(preparedRec);
                                });
                        
                                this.log =preparedArr;

                }) 

                getaccList({
                    accName: this.AccountName
                
                }).then(result=> {
                    console.log('subscription:' +JSON.stringify(result));
                    this.accList = result;
                })

                 .catch(error => {
                    // TODO Error handling
                    this.error = error;
                    this.result = undefined;
                    window.console.log("error :" +JSON.stringify(error));
                })

// contact list 

                // getconList({
                //     accName: this.AccountName
                
                // }).then(result=> {
                //     console.log('Contact data:' +JSON.stringify(result));
                //     this.conList = result;
                    
                // })

                //  .catch(error => {
                //     // TODO Error handling
                //     this.error = error;
                //     this.result = undefined;
                //     window.console.log("error :" +JSON.stringify(error));
                // });
                
               
             })
        
             .catch(error => {
        
                 // TODO Error handling
        
                 this.error = error;
        
                 this.result = undefined;
        
                 window.console.log("error :" +JSON.stringify(error));
        
             });
       }
   }

  //  @wire(KnowledgeArticleButton, {recordId:'$recordId'})
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
                                         
  //              });
  //       }
  //     else if (error) {
  //         this.error = error;
  //         this.recordData = undefined;
  //     }
  //   }

   SelectRowRecord(event){
    const selectedRows = event.detail.selectedRows;
    console.log("Row Id " +JSON.stringify(selectedRows));
   // selectedRecords =  this.template.querySelector("lightning-datatable").getSelectedRows();  
    //console.log('selected row: ' +JSON.stringify(selectedRecords));
    this.selectedRecords = selectedRows;
    this.Productlist = selectedRows;
    this.productCategory = this.selectedRecords[0].ProductCategory;
      this.ContactNo = this.selectedRecords[0].Phone;
      this.Contactname = this.selectedRecords[0].Name;
      this.Brand = this.selectedRecords[0].ProductSubCategory;
      this.AccountName = this.selectedRecords[0].Account__c;
      this.Email = this.selectedRecords[0].Email;
      this.ContactId = this.selectedRecords[0].ContactId;
      this.product = this.selectedRecords[0].product;
      this.Id = this.selectedRecords[0].Id;
    console.log("Seleted row:" +JSON.stringify(this.selectedRecords[0].Id)); 
  }
    
  handleRowAction(event) {
    if (event.detail.action.name === "gotoOpportunity") {

        console.log('event Id'+event.detail.row.product);
        this[NavigationMixin.GenerateUrl]({
            type: "standard__recordPage",
            attributes: {
                recordId: event.detail.row.product,
                actionName: "view"
            }
        }).then((url) => {
            window.open(url, "_blank");
        });
    }

}     
   ///Button -------------------------------------------

   refreshComponent(event){

    eval("$A.get('e.force:refreshView').fire();");
    
    }

     @api accountId;
     @api ProductName;  
    @track filesize = 0;
    @track recordData;
    @api recordId;
    @track recordType;
    @track entitlementId;

 

    @track customFormModal = false; 
    uploadedFiles = []; file; fileContents; fileReader; content; fileName  

   
    customShowModalPopup() {    
      console.log('show button');  
      if(this.selectedRecords != null && this.ProductCategory !=''){      
      this.customFormModal = true;
    
    }else{
    this.customFormModal = false;
    this.showform=true;
  }
  //   this.showform = true;
  }

  customHideModalPopup() {    
      console.log("insighthidemodalpopup")
     // refreshApex(this.selectedRows);
        //this.refreshComponent;
      this.selectedRows = null;
      this.ContactId = '';
      this.productCategory = '';
      this.Brand = '';
      this.ContactNo='';
      this.Contactname = '';
      this.AccountName = '';
      this.product = '';
      this.Email = '';
      this.customFormModal = false;
     
      
  }

customhideformmodel(){
  console.log("hide modalpopup");
  // this.selectedRows = null;
  // this.ContactId = '';
  // this.productCategory = '';
  // this.Brand = '';
  // this.ContactNo='';
  // this.Contactname = '';
  // this.AccountName = '';
  // this.product = '';
  // this.Email = '';
  this.showform=false;
 // refreshApex(this.selectedRows);
  this.refreshComponent;
}

  showform(){
      if(this.selectedRecords == ''){
        this.showform = true;
      }
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
             });
      }
    else if (error) {
      this.error = error;
      this.resultData = undefined;
      window.console.log("error :" +JSON.stringify(error));
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