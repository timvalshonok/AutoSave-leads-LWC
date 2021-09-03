import { LightningElement, wire, api } from 'lwc';
import getLeads from '@salesforce/apex/LeadsContacts.getLeads';
import getContacts from '@salesforce/apex/LeadsContacts.getContacts';

export default class LeadsContacts extends LightningElement {

    leads;
    contacts;
    wiredLeadsResult;
    wiredContactsResult;
 
    @api lead;
    @api contact;

    @wire(getLeads)
    wiredGetLeads(result) {
        this.wiredLeadsResult = result;
        if (result.data) {
            this.leads = result.data;
            this.error = undefined;
        } else if (result.error) {
            this.error = result.error;
            this.leads = undefined;
        }
    }

    @wire(getContacts)
    wiredGetContacts(result) {
        this.wiredContactsResult = result;
        const {data, error} = result;
        if (data) {
            this.contacts = data.map(contact => {
                return {...contact, idName: `${contact.Id}Name`}
            });
            this.error = undefined;
         } else if (error) {
            this.error = result.error;
            this.contacts = undefined;
        }
    }

}