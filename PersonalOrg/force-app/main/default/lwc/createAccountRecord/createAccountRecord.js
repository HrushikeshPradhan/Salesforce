import { LightningElement } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

export default class CreateAccountRecord extends NavigationMixin(LightningElement) {

    objectApiName = ACCOUNT_OBJECT;
    nameField = NAME_FIELD;
    phoneField = PHONE_FIELD;
    websiteField = WEBSITE_FIELD;

    // Handle form submission success and error
    handleSuccess(event) {
        // Navigate to the newly created account record
        const recordId = event.detail.id;
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: recordId,
                objectApiName: ACCOUNT_OBJECT.objectApiName,
                actionName: 'view',
            }
        });     
    }

    handleError(event) {
        const toastEvent = new ShowToastEvent({
            title: 'Error creating account',
            message: event.detail.message,
            variant: 'error',
        });
        this.dispatchEvent(toastEvent);
    }
}