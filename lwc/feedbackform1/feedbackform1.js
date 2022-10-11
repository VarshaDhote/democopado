import { LightningElement ,track,wire,api} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';  
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; 
const MAX_FILE_SIZE = 100000000; //10mb
import { refreshApex } from '@salesforce/apex';
import casedetails from '@salesforce/apex/CaseEmails.CaseDetails';
import { getRecord } from 'lightning/uiRecordApi';
import { createRecord } from 'lightning/uiRecordApi';
//2. Import the named import updateRecord
import { updateRecord } from "lightning/uiRecordApi";
import CASE_ID from '@salesforce/schema/Case.Id';
import CASE_STATUS from '@salesforce/schema/Case.Status';
import Feedback__c from '@salesforce/schema/Feedback__c';
import  Feedback_Field1 from '@salesforce/schema/Feedback__c.How_satisfied_are_you_with_our_service__c';
import Feedback_Field2 from '@salesforce/schema/Feedback__c.Tell_us_how_we_can_improve__c';
import Feedback_Field3 from '@salesforce/schema/Feedback__c.How_satisfied_are_you_with_our_team__c';
import REVERT_Field from '@salesforce/schema/Case.Revert_mail__c';
import Notify_Field from '@salesforce/schema/Case.resolution_reverted__c';
import Text_Field from '@salesforce/schema/Case.Reason'
import CaseComment_Field from '@salesforce/schema/Case.Case_Comment__c';
import SystemModstamp from '@salesforce/schema/Account.SystemModstamp';




export default class LwcCustomModal extends NavigationMixin(LightningElement) {
  value = ''; displaytext = ' '; 
   value1= []; casecommnt;
   revertbtn = false;
    @track FeedbackId;

  FIELDS = [
    'Case.Status',
  
  ];

  disabled = false; 
  isSelected = false;
  closetextview = false;
  isRevertSelect = false; @track Revert;
      @api accountId;
    @track filesize = 0;  
    @track recordData;
    @api recordId;
    @track recordType;Subject;
    @track entitlementId;
    @track recordType; caseclose;
    @api currentRecordId;
    @api errorMessage;casedetails;
    @track selectedOption;selectedOption1;feedbacktext;
    @track customFormModal = false; 
    @track customFormModal2 = false; 
    

    uploadedFiles = []; file; fileContents; fileReader; content; fileName  
 
    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    Case;

    connectedCallback(){
      console.log('recordId - '+this.recordId)
      if(window.location.href){
        try{
            let url = new URL(window.location.href);
            var id = url.searchParams.get('id');
            this.recordId = url.searchParams.get('id');
            console.log('Id check11 - '+this.recordId);
            if(id){
                this.myId = id;
                
              }
        } catch(e){
            if(console){
                console.log(JSON.stringify(e));
            }
        }
    }
   
    }

    OnChangeClick(){
      this.Revert = "Reverted";
    }

    @wire(casedetails,{recordId:'$recordId'})
    casedetails;

    @wire(casedetails,{recordId:'$recordId'})
    // casedetails;
       caselist({data,error}){
        if(data){
          // this.casedetails = data;
          console.log("case:"+JSON.stringify(data));
          
           data.forEach(record => {
            this.caseno = record.CaseNumber;
            this.Subject = record.Resolution_Comment__c;
            console.log("this.caseno: " + this.caseno); 
         console.log("subject" + this.Subject);
         
            if(record.Status == 'Closed'){
              console.log('case status :' +record.Status);
              this.disabled = true;
              this.revertbtn = true;
              this.closetextview = true;
              this.displaytext = 'You have accepted the resolution hence your case is closed.';
            }else  if(record.Status == 'In_Progress'){
              console.log('case status :' +record.Status);
              this.revertbtn = true;
              this.closetextview = true;
              this.displaytext = 'We received your message, Thank you.';
            }
            else{
              this.displaytext = '';
            }
          })
       }
      }   
  
 

 // entitlement for Milestone
 
   
customShowModalPopup() {            

  this.customFormModal2 = true;
  this.OnChangeClick();
 // this.disabled = true;
 console.log("test dialog11 "+this.recordId);
 
// this.handleonClick();
//  this.Case.FIELDS.Case.Status ="Closed";
}

customShowModalPopup2() {            

 // this.customFormModal2 = true;
 this.disabled = true;
 console.log("test dialog"+this.recordId);

 this.handleClick();
 
}

handleState() {
  this.isSelected = !this.isSelected;
}

handleState1() {
  this.isRevertSelect = !this.isRevertSelect;
}

  customHideModalPopup() {    
      console.log("insighthidemodalpopup")
      this.customFormModal = false;
  }

  customHideModalPopup2() {    
    console.log("insighthidemodalpopup")
    this.customFormModal2 = false;
    this.customFormModal = false;
    this.closetextview = true;
   // this.displaytext = 'We received your message, Thank you.';
} 

disabled(){
 
  fields[CASE_STATUS.fieldApiName] = 'Closed';
}
 
get options() {
  return [
      { label: 'Very Satisfied', value: 'Very Satisfied' },
      { label: 'Satisfied', value: 'Satisfied' },
      { label: 'Neutral', value: 'Neutral' },
      { label: 'Unsatisfied', value: 'Unsatisfied' },
      { label: 'Very Unsatisfied', value: 'Very Unsatisfied' },
  ];
}

get options2() {
  return [
      { label: 'Very Satisfied', value: 'Very Satisfied' },
      { label: 'Satisfied', value: 'Satisfied' },
      { label: 'Neutral', value: 'Neutral' },
      { label: 'Unsatisfied', value: 'Unsatisfied' },
      { label: 'Very Unsatisfied', value: 'Very Unsatisfied' },
  ];
}
handleRadio(event) {
  this.selectedOption = event.detail.value;
  console.log('Option selected with value: ' + this.selectedOption);
}

handleRadioButton(event) {
  this.selectedOption1 = event.detail.value;
  console.log('Option selected with value1: ' + this.selectedOption1);
}


handleChangeButton(event){
 this.feedbacktext = event.detail.value;
 console.log('Option selected with value: ' + this.feedbacktext);
}

showSuccessToast() {

  const evt = new ShowToastEvent({

      title: 'Thank you for your valuable feedback.',

      message: 'Thank you for your valuable feedback.',

      variant: 'Thank you for your valuable feedback.',

      mode: 'dismissable'

  });

  this.dispatchEvent(evt);

}

handleSuccess1(event){
  const toastEvent = new ShowToastEvent({
    title:'Success',
    message:'Comment provided successfully',
    variant:'success',

}) 
this.dispatchEvent(toastEvent);
this.customHideModalPopup2();
//this.customFormModal = false;
console.log("record Id : "+event.detail.id);

//this.handleClick();
}

 
  handleSuccess(event) {

    const toastEvent = new ShowToastEvent({
      title:'Thank you for your valuable feedback.',
      message:'Feedback Provided Successfully ',
      variant:'success',

  })
  
   
  this.dispatchEvent(toastEvent);
  this.customHideModalPopup();
  // this.customHideModalPopup2();

  console.log("record Id : "+event.detail.id);
   
  //update case closed
 //  this.handleClick();
  
  }

    
  OnChangeCaseComment(event){
     this.casecommnt = event.detail.value;
     console.log("case comment: " +this.casecommnt);
  }


      ///////////////////////////////////////////////////////////////

      saveClick(event) {
        console.log("submit"+event.detail.id);
        this.template.querySelector('lightning-record-edit-form').submit(this.fields);
      }

      saveonClick(event) {
        console.log("submit"+event.detail.id);
        // this.template.querySelector('lightning-record-edit-form').submit(this.fields);
        this.handleonClick();
      }

      handleClick() {
        //4. map the data to the fields
      const fields = {};
  
      fields[CASE_ID.fieldApiName] = this.recordId;
      fields[CASE_STATUS.fieldApiName] = 'Closed';
      
      
          //5. Create a config object that had info about fields. 
          //Quick heads up here we are not providing Object API Name
      const recordInput = {
        fields: fields
      };
  
          //6. Invoke the method updateRecord()
      updateRecord(recordInput).then((record) => {
        console.log(record);
       // this.updateRecordView();
        this.customFormModal = true;
        this.customFormModal2 = false;
        refreshApex(this.casedetails);
        this.handleState();
      });
    }

    handleonClick() {
      //4. map the data to the fields
    console.log("record Id : "+this.recordId); 
    console.log("comment:" +this.casecommnt);
    const fields = {};

    fields[CASE_ID.fieldApiName] = this.recordId;
    fields[CASE_STATUS.fieldApiName] = 'In_Progress';
    fields[CaseComment_Field.fieldApiName]= this.casecommnt;
    fields[Text_Field.fieldApiName] = 'Revertcase';
    //  fields[REVERT_Field.fieldApiName] = true;
    //  fields[Notify_Field.fieldApiName] = 'Revert';
        //5. Create a config object that had info about fields. 
        //Quick heads up here we are not providing Object API Name
    const recordInput = {
      fields: fields
    };

        //6. Invoke the method updateRecord()
    updateRecord(recordInput).then((record) => {
      console.log(record);
      // this.customFormModal2 = true;
      // this.customFormModal = false;
      // this.customHideModalPopup2();
      // refreshApex(this.casedetails);
      // this.handleState1();
    }) .then(Case => {
      this.customHideModalPopup2();
      refreshApex(this.casedetails);
      this.handleState1();
     
      // this.FeedbackId = ServiceKA__Feedback__c.id;
      // this.customFormModal = false;
      this.dispatchEvent(
          new ShowToastEvent({
              title: 'Thank you for your valuable Comment',
              message: 'Comment Provided Successfully',
              variant: 'success',
          }),
      );
  })
  }
  
//   updateRecordView() {
//     setTimeout(() => {
//          eval("$A.get('e.force:refreshView').fire();");
//     }, 1000); 
//  }


  SaveFeedback(){
    console.log("Test");
        const fields = {};
        fields[Feedback_Field1.fieldApiName] = this.selectedOption;
         fields[Feedback_Field3.fieldApiName] = this.selectedOption1;
         fields[Feedback_Field2.fieldApiName]= this.feedbacktext;
        const recordInput = { apiName: Feedback__c.objectApiName, fields };
        createRecord(recordInput)
        .then(Feedback__c => {
            this.FeedbackId = Feedback__c.id;
            this.customFormModal = false;
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Thank you for your valuable feedback',
                    message: 'Feedback Provided Successfully',
                    variant: 'success',
                }),
            );
        })
      
        .catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error creating record',
                    message: error.body.message,
                    variant: 'error',
                }),
            );
        });
  }




    }