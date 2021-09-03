import { LightningElement, api } from 'lwc';
import recordChange from '@salesforce/apex/LeadsContacts.recordChange';
import { NavigationMixin } from 'lightning/navigation';

export default class LeadsList extends NavigationMixin (LightningElement) {

    @api lead;
    chosenValue = '';

    handleDataChanges(event) {
        this.chosenValue = event.target.dataset.id;
        let lead  = { 'sobjectType': 'Lead' };
        lead.Id = this.chosenValue;
        lead.Phone = this.template.querySelector('[data-element="Phone"]').value;
        lead.Title = this.template.querySelector('[data-element="Title"]').value;
        
        recordChange({ newRecord: lead });
    }

    navigateToLead(event){
        const leadId = event.target.dataset.id;
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: leadId,
                objectApiName: 'Lead',
                actionName: 'view'
            }
        });
    }

}