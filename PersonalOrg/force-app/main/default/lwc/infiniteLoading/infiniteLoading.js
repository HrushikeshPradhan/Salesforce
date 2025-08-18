import { LightningElement } from 'lwc';
import getContacts from '@salesforce/apex/MyContactListController.getContacts';
const columns = [
    { label: 'First Name', fieldName: 'FirstName' },
    { label: 'Last Name', fieldName: 'LastName' }
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
                this.contacts = [...this.contacts, ...result];
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