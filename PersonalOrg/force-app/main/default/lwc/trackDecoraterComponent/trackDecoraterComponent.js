import { LightningElement, track } from 'lwc';

export default class TrackDecoraterComponent extends LightningElement {
    
    // Primitive data types
    firstName;
    lastName;

    // Non-primitive data type
    personDetails = {};
    @track trackPersonDetails = {};

    handleFirstNameChange(event) {
        console.log('First Name is Updating ...');
     //   this.firstName = event.target.value;
     //   this.personDetails.firstName = event.target.value;
        this.trackPersonDetails.firstName = event.target.value;
    }

    handleLastNameChange(event) {
        console.log('Last Name is Updating ...');
     //   this.personDetails.lastName = event.target.value;
     //   this.personDetails.lastName = event.target.value;
        this.trackPersonDetails.lastName = event.target.value;
    }
}
