import { LightningElement, track,wire } from 'lwc';
import getKnowledgeList from '@salesforce/apex/ProjectorKnowledgeArticle.getKnowledgeList';
import { NavigationMixin } from 'lightning/navigation';

const columns = [
   // { label: 'Service Catalogue ', fieldName: "ServiceKA__Service_Catalogue"},
    {
        label: "Title",
        type: "button",
        typeAttributes: { label: { fieldName: "Title" }, name: "gotoOpportunity", variant: "base" },
        target : 'self'
    },
    {label: 'Answer', fieldName: 'Answer__c'}, 
    //{ label: 'Validation Status', fieldName: "ValidationStatus"},
    
];
export default class KnowledgeforProjector extends NavigationMixin(LightningElement) {

  
    @track articleList;
    recordList ;
    articlecolumn = columns;
    log;
    
    @wire(getKnowledgeList, {} )
    articleList;
    
    
     @wire(getKnowledgeList) loglist(result){
  
      if(result.data){
          console.log("data: " +JSON.stringify(result.data));
          this.log = result.data;
          this.error = undefined;
  
  
          let preparedArr = [];
          result.data.forEach(record =>{
              let preparedRec = {};
              preparedRec.Service_Catalogue = record.Service_Catalogue__r.Name;
              preparedRec.Title = record.Title;
              preparedRec.Answer__c = record.Answer__c;
              preparedRec.Id = record.Id;
              preparedRec.ValidationStatus = record.ValidationStatus;
              
  
              preparedArr.push(preparedRec);
          });
  
          this.log =preparedArr;
      }
      else if(result.data){
          this.log = result.error;
          this.error = undefined;
      }
      
     }  
  
  
  
  
  
    
  
    handleRowAction(event) {
      if (event.detail.action.name === "gotoOpportunity") {
          this[NavigationMixin.GenerateUrl]({
              type: "standard__recordPage",
              attributes: {
                  recordId: event.detail.row.Id,
                  actionName: "view"
              }
          }).then((url) => {
              window.open(url, "_blank");
          });
      }
  
  }
   
  
  
  handlePagination(event){
      
      this.recordList = [...event.detail.records  ];
  
  }
}