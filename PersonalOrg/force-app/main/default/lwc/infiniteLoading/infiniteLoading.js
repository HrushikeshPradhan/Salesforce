import { LightningElement } from 'lwc';
import getContacts from '@salesforce/apex/MyContactListController.getContacts';
import FIRST_NAME from '@salesforce/schema/Contact.FirstName';
import LAST_NAME from '@salesforce/schema/Contact.LastName';

const columns = [
    { label: 'First Name', fieldName: FIRST_NAME.fieldApiName },
    { label: 'Last Name', fieldName: LAST_NAME.fieldApiName }
];

export default class InfiniteLoading extends LightningElement {
    contacts = [];
    columns = columns;
    limitSize = 5;
    offset = 0;
    enableInfiniteLoading = false;

    connectedCallback() {
        this.loadContacts();
    }

    loadContacts() {
        getContacts({ offset: this.offset, limitSize: this.limitSize })
            .then(result => {
                this.contacts = [...this.contacts, ...result]; //spread operator to concatenate arrays
                this.enableInfiniteLoading = result.length === this.limitSize;
            })
            .catch(error => {
                console.error('Error loading contacts:', error);
            });
    }

    handleLoadMore(event) {
        event.target.isLoading = true;
        this.offset += this.limitSize;
        this.loadContacts();
        event.target.isLoading = false;
    }
}