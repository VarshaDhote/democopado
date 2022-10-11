import { LightningElement, wire,api, track } from 'lwc';
import caseEmail from '@salesforce/apex/CaseEmails.CaseEmailMessage';
import casedetails from '@salesforce/apex/CaseEmails.CaseDetails';
import casematelogo from '@salesforce/resourceUrl/CasemateLogo';
import casecomment from '@salesforce/apex/CaseEmails.CaseComment';
import My_Resource from '@salesforce/resourceUrl/MyResources';
export default class EmailConversation extends LightningElement {
  
  EmailLogo = My_Resource + '/images/MicrosoftTeams-image (18).png';

  @api accountId;
  @api recordId;
  customers =[] ; casedetails=[]; caseno; 
 @track myId;Subject;casedate;
   connectedCallback(){
    console.log('recordId - '+this.recordId)
    if(window.location.href){
      try{
          let url = new URL(window.location.href);
          var id = url.searchParams.get('id');
          this.recordId = url.searchParams.get('id');
          console.log('Id check - '+this.recordId);
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

   @wire(casedetails,{recordId:'$recordId'})
       casedetails({data,error}){
        if(data){
          this.casedetails = data;
          console.log("case:"+JSON.stringify(data));
          
           data.forEach(record => {
            this.caseno = record.CaseNumber;
            this.Subject = record.Subject;
            console.log("this.caseno: " + this.caseno); 
         
       
          })
       }
      }   
  
      @wire(casecomment,{recordId:'$recordId'})
      casecomment({data,error}){
       if(data){
     
        console.log("case:"+JSON.stringify(data));
        let preparedArr = [];
       
          data.forEach(record => {
            let preparedRec = {};
          this.casedate = record.CreatedDate.replace("T"," , ");
          this.casedate=this.casedate.replace("Z","");
          console.log("this.caseno 123: " + this.casedate);
         
           console.log("this.caseno: " ); 
       
     
         preparedRec.Id = record.Id;
         preparedRec.ParentId = record.ParentId;
         preparedRec.Name = record.CreatedBy.Name;
         preparedRec.CommentBody = record.CommentBody;
         preparedRec.CreatedDate = this.casedate;  
 

         preparedArr.push(preparedRec);
         })

         this.customers = preparedArr;
         console.log("test load:" +JSON.stringify(this.customers));
      }
     }   


//   @wire(caseEmail,{recordId:'$recordId'})
//   wiredContacts({data, error}){
//     if(data){
//       this.customers = data;
//         this.error = undefined;
//         console.log("callll"+ JSON.stringify(data));
//       }
//     else if (error) {
//         this.error = error;
//         this.recordData = undefined;
//     }
// }

}