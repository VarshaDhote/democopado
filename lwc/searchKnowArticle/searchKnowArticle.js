import { LightningElement ,track,wire,api} from 'lwc';
// import server side apex class method 
import getContactList from '@salesforce/apex/customSearchSobjectLWC.getContactList';
import getUserDetails from '@salesforce/apex/customSearchSobjectLWC.getUserDetails';
import { NavigationMixin } from 'lightning/navigation';
import { getRecord } from 'lightning/uiRecordApi';
import USER_ID from '@salesforce/user/Id'; //this is how you will retreive the USER ID of current in user.
import NAME_FIELD from '@salesforce/schema/User.Name';

export default class SearchKnowArticle extends NavigationMixin(LightningElement) {
    @track contactsRecord;
    searchValue = '';
     @track result;
     @track error;
     @track  recordId;
      @track profile;
      @track recodId;
      profiledisplay=false;
      profiledisplayemp = false;
      @track name;
      areLightningCardVisible = false;


      @track name;
      @wire(getRecord, {
          recordId: USER_ID,
          fields: [NAME_FIELD]
      }) wireuser({
          error,
          data
      }) {
          if (error) {
             this.error = error ; 
          } else if (data) {
              this.name = data.fields.Name.value;
          }
      }


   
    // update searchValue var when input field value change
    searchKeyword(event) {
        this.searchValue = event.target.value;
        console.log("search value: "+this.searchValue);
      //  this.searchValue = evt.target.value;
        if(!this.searchValue)
        {
            this.areLightningCardVisible =false;
                    //    this.articleList = [];
                      //  this.ticketList = [];
        }
    }

   
    handleClick(evt){
    //    alert('Test Me ' +this.clickMe);

    this.searchValue = evt.target.value;
    console.log("search value: "+this.searchValue);

    if(this.searchValue.length> 2 ){
        console.log("search value: "+this.searchValue.length );
        this.areLightningCardVisible = true;

         // imperative method on event
         getContactList({
            searchKey: this.searchValue
        })
             .then(result => {
                 this.result =result;
                 this.error = undefined;
                 window.console.log("Data :" +JSON.stringify(result));
             })
             .catch(error => {
                 // TODO Error handling
                 this.error = error;
                 this.result = undefined;
                 window.console.log("error :" +JSON.stringify(error));
             });
            }
    }

    navigateToKnowledgeArticle(event) {
        event.preventDefault();
         
        this.recordId = event.target.id; 
     //  this.recodId = this.recordId.Split('-');
       
       console.log('id => ' + event.target.id);
      //  console.log("record id :" +this.recodId);

      var remove_after= this.recordId.indexOf('-');
      var result =  this.recordId.substring(0, remove_after);

      console.log("result :" +result);
 
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: result,
                objectApiName: 'Knowledge__kav',
                actionName: 'view'
            }
        });
  }

 }